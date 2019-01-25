//
//  JJHistoryListHeaderFooterView.m
//  JJHistoryList
//
//  Created by Joey Chan on 2019/1/24.
//  Copyright © 2019年 Joey Chan. All rights reserved.
//

#import "JJHistoryListHeaderFooterView.h"
@interface JJHistoryListHeaderFooterView ()
@property (nonatomic , strong) UILabel *titleLabel;
@property (nonatomic , strong) UILabel *rightLabel;
@property (nonatomic , strong) UIButton *rightButton;

@end

@implementation JJHistoryListHeaderFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self setupTitleLabel];
        [self setupRightLabel];
    }
    return self;
}

- (void)setupTitleLabel {
    UILabel *titleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
}

- (void)setupRightLabel {
    
    UIButton *rightButton = [[UIButton alloc] init];
    [self.contentView addSubview:rightButton];
    [rightButton addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    self.rightButton = rightButton;
    
    UILabel *rightLabel = [[UILabel alloc] init];
    [self.contentView addSubview:rightLabel];
    self.rightLabel = rightLabel;
}


- (void)setModel:(JJHistoryListKeySectionModel *)model {
    _model = model;
    self.titleLabel.font = model.sectionTitleFont;
    self.titleLabel.text = model.title;
    self.titleLabel.textColor = model.titleColor;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.titleLabel.frame = CGRectMake(self.itemsSpacing, 0, self.frame.size.width/2 - self.itemsSpacing, self.frame.size.height);
    
    if (self.model.sectionRightButtonTitle.length) {
        
        
        NSMutableAttributedString *rightLabelAttributedString = [[NSMutableAttributedString alloc] initWithString:self.model.sectionRightButtonTitle];
        NSAttributedString *rightImageAttributedString;
        NSInteger textLength = self.model.sectionRightButtonTitle.length;
        
    
        
        if (self.model.sectionRightButtonImage) {
            UIImage *rightLabelImage = self.model.sectionRightButtonImage;
            NSTextAttachment *attach = [[NSTextAttachment alloc] init];
            attach.image = rightLabelImage;
            attach.bounds = CGRectMake(0, self.model.sectionRightButtonImageY, self.model.sectionRightButtonImageSize.width, self.model.sectionRightButtonImageSize.height);
            rightImageAttributedString = [NSAttributedString attributedStringWithAttachment:attach];
            [rightLabelAttributedString insertAttributedString:rightImageAttributedString atIndex:0];
            textLength += 1;
        }
        
        [rightLabelAttributedString addAttribute:NSForegroundColorAttributeName value:self.model.sectionRightTitleColor range:NSMakeRange(0, textLength)];
        [rightLabelAttributedString addAttribute:NSFontAttributeName value:self.model.sectionRightTitleFont range:NSMakeRange(0, textLength)];
        
        CGFloat rightLabelWidth = [self sizeWithText:self.model.sectionRightButtonTitle font:self.model.sectionRightTitleFont].width;
        
        self.rightLabel.frame = CGRectMake(self.contentView.frame.size.width - rightLabelWidth - self.itemsSpacing - self.model.sectionRightButtonImageSize.width, 0, rightLabelWidth + self.model.sectionRightButtonImageSize.width, self.frame.size.height);
        
        self.rightButton.frame = CGRectMake(self.contentView.frame.size.width - rightLabelWidth - self.itemsSpacing - self.model.sectionRightButtonImageSize.width, 0, rightLabelWidth + self.model.sectionRightButtonImageSize.width, self.frame.size.height);
        
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.alignment = NSTextAlignmentCenter;
        [rightLabelAttributedString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, textLength)];
        
        self.rightLabel.attributedText = rightLabelAttributedString;
    }
    
}

/// 根据指定文本,字体和最大宽度计算尺寸
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font
{
    NSMutableDictionary *attrDict = [NSMutableDictionary dictionary];
    attrDict[NSFontAttributeName] = font;
    CGSize size = [text boundingRectWithSize:CGSizeMake(self.frame.size.width/2 - self.itemsSpacing, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrDict context:nil].size;
    return size;
}

- (void)rightButtonAction {
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectRightButtonAtSection:)]) {
        [self.delegate selectRightButtonAtSection:self.model.sectionIndex];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
