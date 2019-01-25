//
//  JJHistoryListView.m
//  JJHistoryList
//
//  Created by Joey Chan on 2019/1/23.
//  Copyright © 2019年 Joey Chan. All rights reserved.
//

#import "JJHistoryListView.h"
#import "JJHistoryTableViewCell.h"
#import "JJHistoryListHeaderFooterView.h"

@interface JJHistoryListView () <UITableViewDataSource , UITableViewDelegate>
@property (nonatomic , strong) UITableView *tableView;
@property (nonatomic , strong) JJHistoryListManager *manager;
@end

@implementation JJHistoryListView
- (instancetype)initWithFrame:(CGRect)frame WithJJHistoryListManager:(JJHistoryListManager *)manager {
    self = [super initWithFrame:frame];
    if (self) {
        self.manager = manager;
//        self.backgroundColor = [UIColor redColor];
        [self setupTableView];
    }
    return self;
}

- (void)setupTableView {
    UITableView *tableView = [[UITableView alloc] init];
    [self addSubview:tableView];
    tableView.frame = self.bounds;
//    tableView.sectionHeaderHeight = self.manager.sectionHeaderHeight;
    tableView.dataSource = self;
    tableView.delegate = self;
//    tableView.numberOfSections = self.manager.keysItems.count;
    tableView.tableHeaderView = [UIView new];
    tableView.tableFooterView = [UIView new];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.sectionHeaderHeight = self.manager.sectionHeaderHeight;
    [tableView registerClass:[JJHistoryTableViewCell class] forCellReuseIdentifier:@"JJHistoryTableViewCell"];
    [tableView registerClass:[JJHistoryListHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"JJHistoryListHeaderFooterView"];
    self.tableView = tableView;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.manager.keysItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JJHistoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JJHistoryTableViewCell"];
    NSArray <JJHistoryListKeyItemModel *>*subValueItemsArray = self.manager.valuesItems[indexPath.section];
    cell.delegate = self.delegate;
    cell.itemsHeight = self.manager.itemsHeight;
    cell.itemsAddWidth = self.manager.itemsAddWidth;
    cell.itemsSpacing  = self.manager.itemsSpacing;
    cell.historyListKeySubItemModelArray = subValueItemsArray;
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    JJHistoryListHeaderFooterView *headerView = (JJHistoryListHeaderFooterView *)[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"JJHistoryListHeaderFooterView"];
    JJHistoryListKeySectionModel *model = self.manager.keysItems[section];
    JJHistoryListHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"JJHistoryListHeaderFooterView"];
    headerView.delegate = self.delegate;
    headerView.itemsSpacing = self.manager.itemsSpacing;
    headerView.model = model;
    
    return headerView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray <JJHistoryListKeyItemModel *>*subValueItemsArray = self.manager.valuesItems[indexPath.section];
    
    return [self mathsCellHeightWithSubValueItemsArray:subValueItemsArray];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return self.manager.sectionHeaderHeight;
}

- (CGFloat)mathsCellHeightWithSubValueItemsArray:(NSArray <JJHistoryListKeyItemModel*>*)subValueItemsArray {
    
    CGFloat viewWidth = self.frame.size.width  - self.manager.itemsSpacing * 2;
    CGFloat saveRowWidth = 0.0;
    CGFloat saveRowHeight = 0.0;
    for (JJHistoryListKeyItemModel *model in subValueItemsArray) {
        NSLog(@"model.title == %@",model.title);
        saveRowWidth += [self sizeWithText:model.title font:model.itemFont].width + self.manager.itemsAddWidth + self.manager.itemsSpacing;
        if (saveRowWidth >= viewWidth) {
            saveRowHeight += self.manager.itemsHeight + self.manager.itemsSpacing;
            saveRowWidth = 0.0;
        }
    }
    return saveRowHeight + self.manager.itemsHeight + self.manager.itemsSpacing;
}

/// 根据指定文本,字体和最大宽度计算尺寸
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font
{
    NSMutableDictionary *attrDict = [NSMutableDictionary dictionary];
    attrDict[NSFontAttributeName] = font;
    CGSize size = [text boundingRectWithSize:CGSizeMake(self.frame.size.width - self.manager.itemsSpacing * 2, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrDict context:nil].size;
    return size;
}

///更新列表
- (void)reloadList {
    [self.tableView reloadData];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
