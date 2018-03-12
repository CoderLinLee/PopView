//
//  RegionChooseView.m
//  PopView
//
//  Created by 李林 on 2018/3/9.
//  Copyright © 2018年 李林. All rights reserved.
//

#import "RegionChooseView.h"
#import "PopSliderBelowStaticVar.h"

@interface RegionChooseView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *leftTableView;
@property (nonatomic ,strong) UITableView *rightTableView;
@property (nonatomic ,strong) UIView *toolView;


@property (nonatomic ,copy) NSArray <NSString *>*leftArr;
@property (nonatomic ,copy) NSArray <NSArray *>*rightArr;

@property (nonatomic ,assign) NSInteger selectLeftIndex;
@property (nonatomic ,assign) NSInteger selectRightIndex;

@end
@implementation RegionChooseView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.leftTableView];
        [self addSubview:self.rightTableView];
        [self addSubview:self.toolView];
        self.selectLeftIndex = 0;
    }
    return self;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    UILabel *titleLabel = [cell.contentView viewWithTag:999];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(10, 43.7, self.bounds.size.width, segmentingLineHeight)];
        lineView.backgroundColor = segmentingLineColor;
        [cell.contentView addSubview:lineView];
        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.bounds.size.width, 43)];
        [cell.contentView addSubview:titleLabel];
        titleLabel.tag = 999;
        
    }
    
    if (tableView == self.leftTableView) {
        titleLabel.text = [self.leftArr objectAtIndex:indexPath.row];
        titleLabel.textColor = self.selectLeftIndex == indexPath.row ? [UIColor redColor] : [UIColor blackColor];
    }else{
        NSArray *sectionDetailArr = [self.rightArr objectAtIndex:self.selectLeftIndex];
        titleLabel.text = [sectionDetailArr objectAtIndex:indexPath.row];
        titleLabel.textColor = self.selectRightIndex == indexPath.row ? [UIColor redColor] : [UIColor blackColor];
    }
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.leftTableView) {
        return self.leftArr.count;
    }else{
        return [self.rightArr objectAtIndex:self.selectLeftIndex].count;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (tableView == self.leftTableView) {
        self.selectLeftIndex = indexPath.row;
        self.selectRightIndex = 0;
        [self.leftTableView reloadData];
        [self.rightTableView reloadData];
    }else if (tableView == self.rightTableView){
        self.selectRightIndex = indexPath.row;
        [self.rightTableView reloadData];
    }
}
- (void)resetClick{
    
}

- (UITableView *)rightTableView{
    if (_rightTableView == nil) {
        _rightTableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _rightTableView.frame = CGRectMake(self.bounds.size.width/2, 0, self.bounds.size.width/2, self.bounds.size.height  - self.toolView.bounds.size.height);
        _rightTableView.delegate = self;
        _rightTableView.dataSource = self;
        _rightTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _rightTableView.backgroundColor = [UIColor colorWithRed:242.0/255 green:242.0/255 blue:242.0/255 alpha:1];

    }
    return _rightTableView;
}

- (UITableView *)leftTableView{
    if (_leftTableView == nil) {
        _leftTableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _leftTableView.frame = CGRectMake(0, 0, self.bounds.size.width/2, self.bounds.size.height - self.toolView.bounds.size.height);
        _leftTableView.delegate = self;
        _leftTableView.dataSource = self;
        _leftTableView.backgroundColor = [UIColor clearColor];
        _leftTableView.showsVerticalScrollIndicator = NO;
        _leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    }
    return _leftTableView;
}
- (NSArray<NSString *> *)leftArr{
    if (_leftArr == nil) {
        _leftArr = @[
                      @"区域",
                      @"地铁",
                      @"附近"
                      ];
    }
    return _leftArr;
}
- (NSArray <NSArray *>*)rightArr{
    if (_rightArr == nil) {
        NSArray *arr1 = @[@"不限",@"南山",@"福田",@"罗湖",@"龙岗",@"龙华",@"宝安",@"坪山",@"盐田"];
        NSArray *arr2 = @[@"1号线",@"2号线",@"3号线",@"4号线",@"5号线",@"7号线",@"9号线",@"11号线"];
        NSArray *arr3 = @[@"不限",@"1000米内",@"2000米内",@"3000米内",@"4000米内"];
        _rightArr = @[
                     arr1,
                     arr2,
                     arr3
                     ];
    }
    return _rightArr;
}

- (UIView *)toolView{
    if (_toolView == nil) {
        _toolView = [[UIView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height - 60, self.bounds.size.width, 60)];
        UIButton *resetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [resetBtn setTitle:@"重置" forState:UIControlStateNormal];
        [resetBtn addTarget:self action:@selector(resetClick) forControlEvents:UIControlEventTouchUpInside];
        CGFloat margin = 10;
        resetBtn.frame = CGRectMake(margin, margin, self.bounds.size.width/2 - 2*margin, _toolView.bounds.size.height - 2*margin);
        resetBtn.backgroundColor = [UIColor colorWithRed:245.0/255 green:245.0/255 blue:245.0/255 alpha:1];
        [resetBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [_toolView addSubview:resetBtn];
        resetBtn.layer.cornerRadius = 2;

        UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
        [sureBtn addTarget:self action:@selector(resetClick) forControlEvents:UIControlEventTouchUpInside];
        sureBtn.frame = CGRectMake(self.bounds.size.width/2 + margin, margin, self.bounds.size.width/2 - 2*margin, _toolView.bounds.size.height - 2*margin);
        sureBtn.backgroundColor = [UIColor colorWithRed:99/255.0 green:213/255.0 blue:99/255.0 alpha:1];;
        [_toolView addSubview:sureBtn];
        sureBtn.layer.cornerRadius = 2;

        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 0.3)];
        [_toolView addSubview:lineView];
        lineView.backgroundColor = [UIColor lightGrayColor];
        

    }
    return _toolView;
}
@end
