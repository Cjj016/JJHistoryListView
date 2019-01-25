//
//  ViewController.m
//  JJHistoryList
//
//  Created by Joey Chan on 2019/1/23.
//  Copyright © 2019年 Joey Chan. All rights reserved.
//

#import "ViewController.h"
#import "JJHistoryListView.h"
#import "JJHistoryItemDelegate.h"
@interface ViewController () <JJHistoryItemDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    JJHistoryListManager *manager = [[JJHistoryListManager alloc] init];
    
    ///创建分区对象数据
    NSArray *sectionTitleArray = @[@"热门搜索",@"历史搜索",@"发现搜索"];
    NSMutableArray *keysItems = [NSMutableArray array];
    NSInteger sectionIndex = 0;
    for (NSString *sectionTitle in sectionTitleArray) {
        
        JJHistoryListKeySectionModel *historyListKeySectionModel = [[JJHistoryListKeySectionModel alloc] init];
        ///分区文字字体
        historyListKeySectionModel.sectionTitleFont = [UIFont systemFontOfSize:13];
        ///分区背景颜色
        historyListKeySectionModel.sectionBackgrandColor = [UIColor clearColor];
        
        ///分区文字
        historyListKeySectionModel.title = sectionTitle;
        ///分区文字颜色
        historyListKeySectionModel.titleColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
        
        if (sectionIndex > 0) {
            ///分区右边按钮图片
            historyListKeySectionModel.sectionRightButtonImage = [UIImage imageNamed:@"清空.png"];
            ///分区右边按钮文字
            historyListKeySectionModel.sectionRightButtonTitle = @"清空";
            ///分区按钮颜色
            historyListKeySectionModel.sectionRightTitleFont = [UIFont systemFontOfSize:13];
            ///分区按钮右边文字
            historyListKeySectionModel.sectionRightTitleColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
            ///分区按钮y坐标调整
            historyListKeySectionModel.sectionRightButtonImageY = -2;
            ///分区按钮icon大小
            historyListKeySectionModel.sectionRightButtonImageSize = CGSizeMake(15, 15);
        }
        
        ///分区下表
        historyListKeySectionModel.sectionIndex = sectionIndex;
        [keysItems addObject:historyListKeySectionModel];
        sectionIndex++;
    }
    
    
    
    ///创建分区对应的items数据
    NSArray *itemsValueArray = @[
                                 @[@"曼谷",@"芭提雅",@"收益",@"首付低",@"性价比",@"升值空间",@"泰国政策",@"芭提雅",@"收益",@"首付低",@"性价比",@"升值空间",@"泰国政策"],
                                 @[@"升值空间",@"泰国政策",@"芭提雅",@"收益",@"首付低",@"性价比",@"升值空间",@"泰国政策"],
                                 @[@"芭提雅",@"收益",@"首付低"],
                                 ];
    
    NSMutableArray *valuesItems = [NSMutableArray array];
    
    NSInteger itemSectionIndex = 0;
    NSInteger itemIndex = 0;
    for (NSArray *itemsSubValueArray in itemsValueArray) {
        
        NSMutableArray *valuesSubItems = [NSMutableArray array];
        for (NSString *itemsValueTitle in itemsSubValueArray) {
            JJHistoryListKeyItemModel *historyListKeyItemModel = [[JJHistoryListKeyItemModel alloc] init];
            ///标签字体
            historyListKeyItemModel.itemFont = [UIFont systemFontOfSize:12];
            ///标签文字颜色
            historyListKeyItemModel.itemTitleColer = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0];
            ///标签背景颜色
            historyListKeyItemModel.itemBackgrandColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1.0];
            ///标签弧度
            historyListKeyItemModel.radius = 3.0;
            ///长按相应时间
            historyListKeyItemModel.longPressResponseTime = 1.5;
            ///文字
            historyListKeyItemModel.title = itemsValueTitle;
            ///删除按钮
            historyListKeyItemModel.delectImage = [UIImage imageNamed:@"删  除.png"];
            ///删除按钮大小
            historyListKeyItemModel.delectImageSize = CGSizeMake(15, 15);
            ///对应列表坐标
            historyListKeyItemModel.itemIndexPath = [NSIndexPath indexPathForItem:itemIndex inSection:itemSectionIndex];
            
            [valuesSubItems addObject:historyListKeyItemModel];
            itemIndex++;
        }
        [valuesItems addObject:valuesSubItems];
        itemSectionIndex++;
        itemIndex = 0;
    }
    manager.keysItems = keysItems;
    manager.valuesItems = valuesItems;
    manager.sectionHeaderHeight = 60;
    manager.itemsHeight = 23.f;
    manager.itemsAddWidth = 20.f;
    manager.itemsSpacing = 10.0;
    JJHistoryListView *searchHistoryListView = [[JJHistoryListView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) WithJJHistoryListManager:manager];
    searchHistoryListView.delegate = self;
    [self.view addSubview:searchHistoryListView];
    [searchHistoryListView reloadList];
}

///点击标签的坐标
- (void)selectItemAtIndexPath:(NSIndexPath *)indexPath {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:[NSString stringWithFormat:@"你点击了分区为%ld\n下标为%ld的item",(long)indexPath.section,(long)indexPath.item] preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}
///点击标签删除按钮的坐标
- (void)selectItemDelectBtnAtIndexPath:(NSIndexPath *)indexPath {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:[NSString stringWithFormat:@"你点击了分区为%ld\n下标为%ld的item的删除按钮",(long)indexPath.section,(long)indexPath.item] preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}
///点击分区头按钮
- (void)selectRightButtonAtSection:(NSInteger)section {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:[NSString stringWithFormat:@"你点击了分区为%ld清空按钮",(long)section] preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}
@end
