//
//  ConditionChooseListView.m
//  PopView
//
//  Created by 李林 on 2018/3/9.
//  Copyright © 2018年 李林. All rights reserved.
//

#import "ConditionChooseListView.h"
#import "PopSliderBelowStaticVar.h"

@interface ConditionChooseListView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,copy) NSArray *titles;

@end

@implementation ConditionChooseListView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.tableView];
        self.tableView.frame = self.bounds;
    }
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    UILabel *titleLabel = [cell.contentView viewWithTag:999];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 43)];
        [cell.contentView addSubview:titleLabel];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.tag = 999;
    }
    titleLabel.text = [self.titles objectAtIndex:indexPath.row];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titles.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.chooseComplete) {
        self.chooseComplete([self.titles objectAtIndex:indexPath.row]);
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    [cell setSeparatorInset:UIEdgeInsetsZero];
    [cell setLayoutMargins:UIEdgeInsetsZero];
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.rowHeight = 44;
        _tableView.scrollEnabled = NO;
    }
    return _tableView;
}

- (NSArray *)titles{
    if (_titles == nil) {
        _titles = @[@"0-100米",@"100-500米",@"500-1000米",@"1000-2000米",@"2000-5000米",@"5000-10000米"];
    }
    return _titles;
}
@end
