//
//  PopSiderViewController.m
//  PopView
//
//  Created by 李林 on 2018/3/8.
//  Copyright © 2018年 李林. All rights reserved.
//

#import "PopSiderViewController.h"
#import "PopView.h"
#import "PopTableListView.h"
#import "SharePanelView.h"
#import "ConditionFilterView.h"
#import "LoginView.h"
#import "QZoneView.h"
#import "CusttomDatePickView.h"
#import "SideLeftBarView.h"

@interface PopSiderViewController ()
@property (nonatomic ,strong) SharePanelView *sharePanelView;
@property (nonatomic ,strong) ConditionFilterView *filterView;
@property (nonatomic ,strong) LoginView *loginView;
@property (nonatomic ,strong) QZoneView *qzoneView;
@property (nonatomic ,strong) CusttomDatePickView *datePickView;
@property (nonatomic ,strong) SideLeftBarView *sideLeftView;
@end

@implementation PopSiderViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)customCenterAnimation:(id)sender {
    CABasicAnimation *showAnima = [CABasicAnimation animationWithKeyPath:@"transform"];
    showAnima.duration = 0.25;
    showAnima.fillMode = kCAFillModeForwards;
    showAnima.removedOnCompletion = YES;
    CATransform3D tofrom = CATransform3DMakeScale(1, 1, 1);
    CATransform3D from = CATransform3DMakeScale(0, 0, 1);
    showAnima.fromValue = [NSValue valueWithCATransform3D:from];
    showAnima.toValue =  [NSValue valueWithCATransform3D:tofrom];
    
    
    CABasicAnimation *hidenAnima = [CABasicAnimation animationWithKeyPath:@"transform"];
    hidenAnima.duration = 0.25;
    hidenAnima.fillMode = kCAFillModeForwards;
    CATransform3D tofrom1 = CATransform3DMakeScale(1, 0, 1);
    CATransform3D from1 = CATransform3DMakeScale(1, 1, 1);
    hidenAnima.fromValue = [NSValue valueWithCATransform3D:from1];
    hidenAnima.toValue =  [NSValue valueWithCATransform3D:tofrom1];
    
    self.loginView.center = self.view.center;
    self.loginView.backgroundColor = [UIColor whiteColor];
    PopView *popView = [PopView showPopContentView:self.loginView showAnimation:showAnima hidenAnimation:hidenAnima];
    popView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    popView.clickOutHidden = NO;
}

- (IBAction)customAnimation:(id)sender {
    self.loginView.center = self.view.center;
    self.loginView.backgroundColor = [UIColor whiteColor];
    PopView *popView = [PopView showSidePopDirect:PopViewDirection_SlideInCenter contentView:self.loginView];
    popView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    popView.clickOutHidden = NO;
}


- (IBAction)customUpClick:(UIButton *)sender {
    PopView *popView = [PopView showSidePopDirect:PopViewDirection_SlideFromUp contentView:self.qzoneView];
    popView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
}

- (IBAction)customLeftClick:(id)sender {
    PopView *popView = [PopView showSidePopDirect:PopViewDirection_SlideFromLeft contentView:self.sideLeftView];
    popView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    
}
- (IBAction)shareClick:(id)sender {
    PopView *popView = [PopView showSidePopDirect:PopViewDirection_SlideFromBottom contentView:self.sharePanelView];
    popView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    
}
- (IBAction)customRightClick:(id)sender {
    PopView *popView = [PopView showSidePopDirect:PopViewDirection_SlideFromRight contentView:self.filterView];
    popView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
}


- (IBAction)datePickClick:(id)sender {
    PopView *popView = [PopView showSidePopDirect:PopViewDirection_SlideFromBottom contentView:self.datePickView];
    popView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
}


- (SharePanelView *)sharePanelView{
    if (_sharePanelView == nil) {
        _sharePanelView = [[NSBundle mainBundle] loadNibNamed:@"SharePanelView" owner:nil options:nil].firstObject;
        _sharePanelView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 200);
    }
    return _sharePanelView;
}

- (ConditionFilterView *)filterView{
    if (_filterView == nil) {
        _filterView = [[ConditionFilterView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width - 100, self.view.bounds.size.height)];
        _filterView.backgroundColor = [UIColor redColor];
    }
    return _filterView;
}

- (LoginView *)loginView{
    if (_loginView == nil) {
        _loginView = [[NSBundle mainBundle] loadNibNamed:@"LoginView" owner:nil options:nil].firstObject;
    }
    return _loginView;
}

-(QZoneView *)qzoneView{
    if (_qzoneView==nil) {
        _qzoneView = [[NSBundle mainBundle] loadNibNamed:@"QZoneView" owner:nil options:nil].firstObject;
        _qzoneView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 280);
    }
    return _qzoneView;
}
-(CusttomDatePickView *)datePickView{
    if (_datePickView==nil) {
        _datePickView = [[NSBundle mainBundle] loadNibNamed:@"CusttomDatePickView" owner:nil options:nil].firstObject;
        _datePickView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 250);
    }
    return _datePickView;
}
- (SideLeftBarView *)sideLeftView{
    if (_sideLeftView==nil) {
        _sideLeftView = [[NSBundle mainBundle] loadNibNamed:@"SideLeftBarView" owner:nil options:nil].firstObject;
        _sideLeftView.frame = CGRectMake(0, 0, self.view.bounds.size.width-100, self.view.bounds.size.height);
    }
    return _sideLeftView;
}
@end
