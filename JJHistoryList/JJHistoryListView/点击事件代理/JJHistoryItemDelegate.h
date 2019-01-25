//
//  JJHistoryItemDelegate.h
//  JJHistoryList
//
//  Created by Joey Chan on 2019/1/25.
//  Copyright © 2019年 Joey Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol JJHistoryItemDelegate <NSObject>

///点击标签的坐标
- (void)selectItemAtIndexPath:(NSIndexPath *)indexPath;
///点击标签删除按钮的坐标
- (void)selectItemDelectBtnAtIndexPath:(NSIndexPath *)indexPath;
///点击分区头按钮
- (void)selectRightButtonAtSection:(NSInteger)section;
@end

NS_ASSUME_NONNULL_END
