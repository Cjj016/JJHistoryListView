//
//  JJHistoryListHeaderFooterView.h
//  JJHistoryList
//
//  Created by Joey Chan on 2019/1/24.
//  Copyright © 2019年 Joey Chan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JJHistoryListKeySectionModel.h"
#import "JJHistoryItemDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface JJHistoryListHeaderFooterView : UITableViewHeaderFooterView

@property (nonatomic , strong) JJHistoryListKeySectionModel *model;

@property (nonatomic , assign) CGFloat itemsSpacing;
///代理
@property (nonatomic ,weak) id <JJHistoryItemDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
