//
//  PriceChooseView.m
//  PopView
//
//  Created by 李林 on 2018/3/9.
//  Copyright © 2018年 李林. All rights reserved.
//

#import "PriceChooseView.h"
#import "PriceChooseToolView.h"
#import "PopSliderBelowStaticVar.h"
#import "PopView.h"


@interface PriceChooseView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,copy) NSArray *titles;

@property (nonatomic ,strong) PriceChooseToolView *toolView;
@property (nonatomic ,assign) NSInteger selectedIndex;


@end

@implementation PriceChooseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.tableView];
        [self addSubview:self.toolView];
        self.selectedIndex = 0;
    }
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    UILabel *titleLabel = [cell.contentView viewWithTag:999];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
         
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.bounds.size.width, 43)];
        [cell.contentView addSubview:titleLabel];
        titleLabel.tag = 999;
    }
    titleLabel.text = [self.titles objectAtIndex:indexPath.row];
    titleLabel.textColor = self.selectedIndex == indexPath.row ? [UIColor redColor] : [UIColor blackColor];
    UIImageView *accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"selected_icon"]];
    cell.accessoryView = self.selectedIndex==indexPath.row ? accessoryView : nil;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titles.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.selectedIndex = indexPath.row;
    [self.tableView reloadData];
}



- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height - self.toolView.bounds.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 44;
    }
    return _tableView;
}
- (PriceChooseToolView *)toolView{
    if (_toolView == nil) {
        _toolView = [[NSBundle mainBundle] loadNibNamed:@"PriceChooseToolView" owner:nil options:nil].firstObject;
        _toolView.frame = CGRectMake(0, self.bounds.size.height - 50, self.bounds.size.width, 50);
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, segmentingLineHeight)];
        [_toolView addSubview:lineView];
        lineView.backgroundColor = [UIColor darkGrayColor];
    }
    return _toolView;
}
- (NSArray *)titles{
    if (_titles == nil) {
        _titles = @[@"不限",@"1000元以下",@"1000-1500元",@"1500-1800元",@"1800-2000元",@"2000-2500元",@"2500-3000元",@"3000-4000元",@"4000-5000元",@"5000-6000元"];
    }
    return _titles;
}


@end
