//
//  JJHistoryTableViewCell.m
//  JJHistoryList
//
//  Created by Joey Chan on 2019/1/24.
//  Copyright © 2019年 Joey Chan. All rights reserved.
//

#import "JJHistoryTableViewCell.h"
#import "JJHistoryItem.h"

@interface JJHistoryTableViewCell ()
@property (nonatomic , strong) NSMutableArray <JJHistoryItem *>*itemsViewArray;
@end

@implementation JJHistoryTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.itemsViewArray = [NSMutableArray array];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat viewWidth = self.frame.size.width  - self.itemsSpacing * 2;
    CGFloat saveRowWidth = 0.0;
    CGFloat saveHeight = self.itemsSpacing;
    if (self.itemsViewArray.count) {
        
        for (JJHistoryItem *item in self.itemsViewArray) {
            [item removeFromSuperview];
        }
        self.itemsViewArray = [NSMutableArray array];
        //        [self.itemsViewArray removeObjectsInRange:NSMakeRange(self.itemsViewArray.count - historyListKeySubItemModelArray.count, self.itemsViewArray.count - historyListKeySubItemModelArray.count)];
    }
    //        if (self.itemsViewArray.count > historyListKeySubItemModelArray.count) {
    //
    //            for (NSInteger i = 0; i < self.itemsViewArray.count - historyListKeySubItemModelArray.count; i++) {
    //                JJHistoryItem *item = self.itemsViewArray[i];
    //                [item removeFromSuperview];
    //                item = nil;
    //            }
    //            [self.itemsViewArray removeObjectsInRange:NSMakeRange(self.itemsViewArray.count - historyListKeySubItemModelArray.count, self.itemsViewArray.count - historyListKeySubItemModelArray.count)];
    //
    //        }
    //
    //        for (NSInteger i = 0; i < self.itemsViewArray.count; i++) {
    //            JJHistoryItem *item = self.itemsViewArray[i];
    //            JJHistoryListKeyItemModel *model = historyListKeySubItemModelArray[i];
    //            CGFloat btnWidth = [self sizeWithText:model.title font:model.itemFont].width + self.itemsAddWidth;
    //
    //            if (i == 0) {
    //                item.frame = CGRectMake(self.itemsSpacing, saveHeight, btnWidth, self.itemsHeight);
    //            }
    //            else if (saveRowWidth > viewWidth) {
    //                saveHeight += self.itemsHeight + self.itemsSpacing;
    //                item.frame = CGRectMake(self.itemsSpacing, saveHeight, btnWidth, self.itemsHeight);
    //                saveRowWidth = 0;
    //            }
    //            else {
    //
    //                item.frame = CGRectMake(saveRowWidth + self.itemsSpacing , saveHeight,  btnWidth, self.itemsHeight);
    //            }
    //
    //            saveRowWidth += btnWidth + self.itemsSpacing;
    //
    //            item.model = model;
    //        }
    //
    //        for (NSInteger i = self.itemsViewArray.count ; i < historyListKeySubItemModelArray.count; i++) {
    //
    //            JJHistoryListKeyItemModel *model = historyListKeySubItemModelArray[i];
    //            CGFloat btnWidth = [self sizeWithText:model.title font:model.itemFont].width + self.itemsAddWidth;
    //
    //
    //            NSLog(@"saveRowWidth == %f",saveRowWidth);
    //
    //            JJHistoryItem *item = [[JJHistoryItem alloc] init];
    //            item.model = model;
    //            item.delegate = self.delegate;
    //            [self.contentView addSubview:item];
    //
    //            if (i == 0) {
    //                item.frame = CGRectMake(self.itemsSpacing, saveHeight, btnWidth, self.itemsHeight);
    //            }
    //            else if (saveRowWidth > viewWidth) {
    //                saveHeight += self.itemsHeight + self.itemsSpacing;
    //                item.frame = CGRectMake(self.itemsSpacing, saveHeight, btnWidth, self.itemsHeight);
    //                saveRowWidth = 0;
    //            }
    //            else {
    //
    //                item.frame = CGRectMake(saveRowWidth + self.itemsSpacing , saveHeight,  btnWidth, self.itemsHeight);
    //            }
    //
    //            saveRowWidth += btnWidth + self.itemsSpacing;
    //
    //            [self.itemsViewArray addObject:item];
    //        }
    //    } else {
    
    NSLog(@"viewWidth == %f",viewWidth);
    
    for (NSInteger i = 0; i < self.historyListKeySubItemModelArray.count; i++) {
        
        JJHistoryListKeyItemModel *model = self.historyListKeySubItemModelArray[i];
        CGFloat btnWidth = [self sizeWithText:model.title font:model.itemFont].width + self.itemsAddWidth;
        
        NSLog(@"saveRowWidth == %f",saveRowWidth);
        
        JJHistoryItem *item = [[JJHistoryItem alloc] init];
        item.model = model;
        item.delegate = self.delegate;
        [self.contentView addSubview:item];
        
        if (i == 0) {
            item.frame = CGRectMake(self.itemsSpacing, saveHeight, btnWidth, self.itemsHeight);
        }
        else if (saveRowWidth + btnWidth > viewWidth) {
            saveHeight += self.itemsHeight + self.itemsSpacing;
            item.frame = CGRectMake(self.itemsSpacing, saveHeight, btnWidth, self.itemsHeight);
            saveRowWidth = 0;
        }
        else {
            
            item.frame = CGRectMake(saveRowWidth + self.itemsSpacing , saveHeight,  btnWidth, self.itemsHeight);
        }
        
        saveRowWidth += btnWidth + self.itemsSpacing;
        
        [self.itemsViewArray addObject:item];
    }
    //    }
}

- (void)setHistoryListKeySubItemModelArray:(NSArray<JJHistoryListKeyItemModel *> *)historyListKeySubItemModelArray {
    _historyListKeySubItemModelArray = historyListKeySubItemModelArray;
}


/// 根据指定文本,字体和最大宽度计算尺寸
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font
{
    NSMutableDictionary *attrDict = [NSMutableDictionary dictionary];
    attrDict[NSFontAttributeName] = font;
    CGSize size = [text boundingRectWithSize:CGSizeMake(self.frame.size.width - self.itemsSpacing, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrDict context:nil].size;
    return size;
}




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
