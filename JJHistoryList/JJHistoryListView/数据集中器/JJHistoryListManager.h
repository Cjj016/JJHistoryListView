//
//  JJHistoryListManager.h
//  JJHistoryList
//
//  Created by Joey Chan on 2019/1/23.
//  Copyright © 2019年 Joey Chan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JJHistoryListKeyItemModel.h"
#import "JJHistoryListKeySectionModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JJHistoryListManager : NSObject

///分区头高度
@property (nonatomic , assign) CGFloat sectionHeaderHeight;

///按键高度
@property (nonatomic , assign) CGFloat itemsHeight;

///按键增加宽度
@property (nonatomic , assign) CGFloat itemsAddWidth;

///按键之间间距
@property (nonatomic , assign) CGFloat itemsSpacing;

///标签数据
@property (nonatomic , copy) NSArray <NSArray <JJHistoryListKeyItemModel*>*>*valuesItems;

///分区数据
@property (nonatomic , copy) NSArray <JJHistoryListKeySectionModel *>*keysItems;



@end

NS_ASSUME_NONNULL_END
