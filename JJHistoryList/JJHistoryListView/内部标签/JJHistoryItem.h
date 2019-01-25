//
//  JJHistoryItem.h
//  JJHistoryList
//
//  Created by Joey Chan on 2019/1/24.
//  Copyright © 2019年 Joey Chan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JJHistoryListKeyItemModel.h"
#import "JJHistoryItemDelegate.h"
NS_ASSUME_NONNULL_BEGIN



@interface JJHistoryItem : UIView

@property (nonatomic , strong) JJHistoryListKeyItemModel *model;
@property (nonatomic , assign) BOOL showDelet;
@property (nonatomic , weak) id <JJHistoryItemDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
