//
//  PopSliderBelowViewViewController.m
//  PopView
//
//  Created by 李林 on 2018/3/9.
//  Copyright © 2018年 李林. All rights reserved.
//

#import "PopSliderBelowViewViewController.h"
#import "PopView.h"
#import "YLButton.h"
#import "PopTableListView.h"
#import "HouseConditionFilterView.h"
#import "ConditionChooseListView.h"

@interface PopSliderBelowViewViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *tableView;

@property (nonatomic ,strong) YLButton *ylTitleBtn;
@property (nonatomic ,strong) ConditionChooseListView *chooseListView;
@property (nonatomic ,strong) HouseConditionFilterView *houseFilterView;

@end

@implementation PopSliderBelowViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = self.ylTitleBtn;
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.houseFilterView];
    self.view.backgroundColor = [UIColor colorWithRed:242.0/255 green:242.0/255 blue:242.0/255 alpha:1];
    self.tableView.contentInsetAdjustmentBehavior = NO;
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    
    __weak typeof(self) weakSelf = self;
    [self.chooseListView setChooseComplete:^(NSString *title) {
        [weakSelf.ylTitleBtn setTitle:title forState:UIControlStateNormal];
    }];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    cell.imageView.image = [UIImage imageNamed:@"liudehua"];
    cell.textLabel.text = @"这里是列表数据";
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
//实现scrollView代理
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
//竖直滑动时 判断是上滑还是下滑
    if(velocity.y>0){
        //上滑
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        [UIView animateWithDuration:0.25 animations:^{
            CGRect filterViewFrame = self.houseFilterView.frame;
            filterViewFrame.origin.y = 20;
            self.houseFilterView.frame = filterViewFrame;
            
            CGRect tableViewFrame = self.tableView.frame;
            tableViewFrame.origin.y = CGRectGetMaxY(filterViewFrame);
            tableViewFrame.size.height = self.view.frame.size.height - CGRectGetMaxY(filterViewFrame);
            self.tableView.frame = tableViewFrame;
        }];
    }else{
        //下滑
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        [UIView animateWithDuration:0.25 animations:^{
            CGRect filterViewFrame = self.houseFilterView.frame;
            filterViewFrame.origin.y = 64;
            self.houseFilterView.frame = filterViewFrame;
            
            CGRect tableViewFrame = self.tableView.frame;
            tableViewFrame.origin.y = CGRectGetMaxY(filterViewFrame);
            tableViewFrame.size.height = self.view.frame.size.height - CGRectGetMaxY(filterViewFrame);
            self.tableView.frame = tableViewFrame;
        }];
    }
}



-(void)chooseClick:(UIButton *)btn{
    btn.selected = !btn.selected;
    if (btn.selected) {
        [UIView animateWithDuration:0.25 animations:^{
            btn.imageView.transform = CGAffineTransformRotate(btn.transform, M_PI);
        }];
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, 0)];
        [self.view addSubview:view];
        PopView *popView = [PopView popSideContentView:self.chooseListView belowView:view];
        popView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
        [popView setDidRemovedFromeSuperView:^{
            btn.selected = NO;
            [UIView animateWithDuration:0.25 animations:^{
                btn.imageView.transform = CGAffineTransformIdentity;
            }];
        }];
        [view removeFromSuperview];
    }else{
        [UIView animateWithDuration:0.25 animations:^{
            btn.imageView.transform = CGAffineTransformIdentity;
        }];
        [PopView hidenPopView];
    }
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.houseFilterView.frame), self.view.bounds.size.width, self.view.frame.size.height - CGRectGetMaxY(self.houseFilterView.frame)) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 80;
        _tableView.backgroundColor = [UIColor clearColor];
    }
    return _tableView;
}

- (YLButton *)ylTitleBtn{
    if (_ylTitleBtn == nil) {
        _ylTitleBtn = [YLButton buttonWithType:UIButtonTypeCustom];
        _ylTitleBtn.frame = CGRectMake(0, 0, 100, 30);
        [_ylTitleBtn setTitle:@"选择" forState:UIControlStateNormal];
        [_ylTitleBtn setImage:[UIImage imageNamed:@"triangle_icon"] forState:UIControlStateNormal];
        [_ylTitleBtn setTitleRect:CGRectMake(0, 0, 70, 30)];
        [_ylTitleBtn setImageRect:CGRectMake(70, 0, 30, 30)];
        _ylTitleBtn.imageView.contentMode = UIViewContentModeCenter;
        [_ylTitleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _ylTitleBtn.titleLabel.textAlignment = NSTextAlignmentRight;
        [_ylTitleBtn addTarget:self action:@selector(chooseClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _ylTitleBtn;
}

- (ConditionChooseListView *)chooseListView{
    if (_chooseListView == nil) {
        _chooseListView = [[ConditionChooseListView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 6*44)];
        _chooseListView.backgroundColor = [UIColor whiteColor];
        _chooseListView.layer.cornerRadius = 5;
    }
    return _chooseListView;
}

-(HouseConditionFilterView *)houseFilterView{
    if (_houseFilterView==nil) {
        _houseFilterView = [[NSBundle mainBundle] loadNibNamed:@"HouseConditionFilterView" owner:nil options:nil].firstObject;
        _houseFilterView.frame = CGRectMake(0, 64, self.view.bounds.size.width, 50);
    }
    return _houseFilterView;
}

@end
