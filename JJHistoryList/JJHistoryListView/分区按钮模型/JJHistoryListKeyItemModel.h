//
//  JJHistoryListKeyItemModel.h
//  JJHistoryList
//
//  Created by Joey Chan on 2019/1/24.
//  Copyright © 2019年 Joey Chan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface JJHistoryListKeyItemModel : NSObject
///标签字体
@property (nonatomic , copy) UIFont *itemFont;
///标签问题颜色
@property (nonatomic , copy) UIColor *itemTitleColer;
///标签背景颜色
@property (nonatomic , copy) UIColor *itemBackgrandColor;
///标签弧度
@property (nonatomic , assign) CGFloat radius;
///长按相应时间
@property (nonatomic , assign) NSTimeInterval longPressResponseTime;
///文字
@property (nonatomic , copy) NSString *title;
///删除按钮
@property (nonatomic , copy) UIImage *delectImage;
///删除按钮大小
@property (nonatomic , assign) CGSize delectImageSize;
///对应的下标
@property (nonatomic , copy) NSIndexPath *itemIndexPath;

@end

NS_ASSUME_NONNULL_END
