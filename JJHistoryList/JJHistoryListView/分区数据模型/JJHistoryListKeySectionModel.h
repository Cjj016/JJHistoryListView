//
//  JJHistoryListKeySectionModel.h
//  JJHistoryList
//
//  Created by Joey Chan on 2019/1/24.
//  Copyright © 2019年 Joey Chan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface JJHistoryListKeySectionModel : NSObject
///分区按钮y坐标调整
@property (nonatomic , assign) CGFloat sectionRightButtonImageY;
///分区按钮icon大小
@property (nonatomic , assign) CGSize sectionRightButtonImageSize;
///分区按钮文字字体
@property (nonatomic , copy) UIColor *sectionRightTitleColor;
///分区按钮文字字体
@property (nonatomic , copy) UIFont *sectionRightTitleFont;
///分区文字颜色
@property (nonatomic , copy) UIColor *titleColor;
///分区文字字体
@property (nonatomic , copy) UIFont *sectionTitleFont;
///分区背景颜色
@property (nonatomic , copy) UIColor *sectionBackgrandColor;
///分区右边按钮图片
@property (nonatomic , copy) UIImage *sectionRightButtonImage;
///分区右边按钮文字
@property (nonatomic , copy) NSString *sectionRightButtonTitle;
///分区文字
@property (nonatomic , copy) NSString *title;
///分区下标
@property (nonatomic , assign) NSInteger sectionIndex;
@end

NS_ASSUME_NONNULL_END
