//
//  JJHistoryTableViewCell.h
//  JJHistoryList
//
//  Created by Joey Chan on 2019/1/24.
//  Copyright © 2019年 Joey Chan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JJHistoryListKeyItemModel.h"
#import "JJHistoryItemDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface JJHistoryTableViewCell : UITableViewCell

///按钮数据
@property (nonatomic ,copy) NSArray <JJHistoryListKeyItemModel *>*historyListKeySubItemModelArray;

@property (nonatomic ,assign) CGFloat itemsHeight;

///按钮增加宽度
@property (nonatomic ,assign) CGFloat itemsAddWidth;

///按钮间距
@property (nonatomic ,assign) CGFloat itemsSpacing;

///代理
@property (nonatomic ,weak) id <JJHistoryItemDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
