//
//  HouseChooseView.m
//  PopView
//
//  Created by 李林 on 2018/3/9.
//  Copyright © 2018年 李林. All rights reserved.
//

#import "HouseChooseView.h"
#import "MoreChooseView.h"
#import "PopSliderBelowStaticVar.h"
#import "PopView.h"

@interface HouseChooseView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,copy) NSArray <MoreChooseItemModel *>*titles;

@property (nonatomic ,strong) UIView *toolView;
@property (nonatomic ,assign) NSInteger selectedIndex;

@end
@implementation HouseChooseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.tableView];
        [self addSubview:self.toolView];
    }
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    UILabel *titleLabel = [cell.contentView viewWithTag:999];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, self.bounds.size.width, tableView.rowHeight - segmentingLineHeight)];
        [cell.contentView addSubview:titleLabel];
        titleLabel.tag = 999;
    }
    MoreChooseItemModel *item = [self.titles objectAtIndex:indexPath.row];
    titleLabel.text = item.itemName;
    titleLabel.textColor = item.seleted ? [UIColor redColor] : [UIColor blackColor];
    UIImageView *accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"selected_icon"]];
    cell.accessoryView = item.seleted ? accessoryView : nil;

    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titles.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MoreChooseItemModel *item = [self.titles objectAtIndex:indexPath.row];
    if (indexPath.row == 0) {
        for (MoreChooseItemModel *item in self.titles) {
            item.seleted = NO;
        }
        item.seleted = YES;
    }else{
        self.titles.firstObject.seleted = NO;
        item.seleted = !item.seleted;
        NSInteger selectCount = 0;
        for (MoreChooseItemModel *item in self.titles) {
            if (item.seleted) {
                selectCount++;
            }
        }
        self.titles.firstObject.seleted = selectCount==0;
    }
    [self.tableView reloadData];
}

- (void)sureClick{
    [PopView hidenPopView];
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height - self.toolView.bounds.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.rowHeight = 44;
    }
    return _tableView;
}

- (NSArray <MoreChooseItemModel *>*)titles{
    if (_titles == nil) {
        MoreChooseItemModel *item0 = [[MoreChooseItemModel alloc] init];
        item0.itemName = @"不限";
        item0.seleted = YES;
        MoreChooseItemModel *item1 = [[MoreChooseItemModel alloc] init];
        item1.itemName = @"一室";
        MoreChooseItemModel *item2 = [[MoreChooseItemModel alloc] init];
        item2.itemName = @"二室";
        MoreChooseItemModel *item3 = [[MoreChooseItemModel alloc] init];
        item3.itemName = @"三室";
        MoreChooseItemModel *item4 = [[MoreChooseItemModel alloc] init];
        item4.itemName = @"四室";
        MoreChooseItemModel *item5 = [[MoreChooseItemModel alloc] init];
        item5.itemName = @"五室及以上";
        _titles = @[item0,item1,item2,item3,item4,item5];
    }
    return _titles;
}
- (UIView *)toolView{
    if (_toolView == nil) {
        _toolView = [[UIView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height - 60, self.bounds.size.width, 60)];
        CGFloat margin = 10;

        
        UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
        [sureBtn addTarget:self action:@selector(sureClick) forControlEvents:UIControlEventTouchUpInside];
        sureBtn.frame = CGRectMake (margin, margin, self.bounds.size.width - 2*margin, _toolView.bounds.size.height - 2*margin);
        sureBtn.backgroundColor = [UIColor colorWithRed:99/255.0 green:213/255.0 blue:99/255.0 alpha:1];;
        [_toolView addSubview:sureBtn];
        sureBtn.layer.cornerRadius = 2;
        
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, segmentingLineHeight)];
        [_toolView addSubview:lineView];
        lineView.backgroundColor = segmentingLineColor;
        
        
    }
    return _toolView;
}
@end
