//
//  JJHistoryListView.h
//  JJHistoryList
//
//  Created by Joey Chan on 2019/1/23.
//  Copyright © 2019年 Joey Chan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JJHistoryListManager.h"
#import "JJHistoryItemDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface JJHistoryListView : UIView
@property (nonatomic , weak) id <JJHistoryItemDelegate> delegate;
- (instancetype)initWithFrame:(CGRect)frame WithJJHistoryListManager:(JJHistoryListManager *)manager;
- (void)reloadList;

@end

NS_ASSUME_NONNULL_END
