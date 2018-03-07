//
//  ViewController.m
//  PopView
//
//  Created by 李林 on 2018/2/27.
//  Copyright © 2018年 李林. All rights reserved.
//

#import "ViewController.h"
#import "PopView.h"
#import "PopTableListView.h"
#import "SharePanelView.h"
#import "ConditionFilterView.h"
#import "LoginView.h"
#import "QZoneView.h"
#import "CusttomDatePickView.h"
#import "SideLeftBarView.h"

@interface ViewController ()
@property (nonatomic ,strong) UIView *popContentView;
@property (nonatomic ,strong) UIView *midContentView;
@property (nonatomic ,strong) UIView *sideContentView;
@property (nonatomic ,strong) SharePanelView *sharePanelView;
@property (nonatomic ,strong) ConditionFilterView *filterView;
@property (nonatomic ,strong) LoginView *loginView;
@property (nonatomic ,strong) QZoneView *qzoneView;
@property (nonatomic ,strong) CusttomDatePickView *datePickView;
@property (nonatomic ,strong) SideLeftBarView *sideLeftView;
@property (nonatomic ,strong) PopTableListView *popListView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.popContentView = self.popListView;
}

- (void)closePopView{
    [PopView hidenPopView];
}

- (IBAction)customAnimation:(id)sender {
    CGFloat SWidth = self.view.bounds.size.width;
    CGFloat SHeight = self.view.bounds.size.height;
    CGFloat height = 250;
    CGPoint locationPoint = CGPointMake(SWidth/2, SHeight/2+100);

    CABasicAnimation *showAnima = [CABasicAnimation animationWithKeyPath:@"position"];
    showAnima.duration = 0.25;
    showAnima.fillMode = kCAFillModeForwards;
    showAnima.fromValue = [NSValue valueWithCGPoint:CGPointMake(SWidth/2, -height/2)];
    showAnima.toValue = [NSValue valueWithCGPoint:locationPoint];
    showAnima.removedOnCompletion = YES;

    
    CABasicAnimation *hidenAnima = [CABasicAnimation animationWithKeyPath:@"position"];
    hidenAnima.duration = 0.25;
    hidenAnima.fillMode = kCAFillModeForwards;
    hidenAnima.fromValue = [NSValue valueWithCGPoint:locationPoint];
    hidenAnima.toValue = [NSValue valueWithCGPoint:CGPointMake(SWidth/2, SHeight+height/2)];
    
    
    self.loginView.center = locationPoint;
    self.loginView.backgroundColor = [UIColor whiteColor];
    PopView *popView = [PopView showPopSideContentView:self.loginView showAnimation:showAnima hidenAnimation:hidenAnima];
    popView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    popView.clickOutHidden = NO;
}


#pragma mark- 
- (IBAction)customUpClick:(UIButton *)sender {
    PopView *popView = [PopView showSidePopDirect:PopViewDirection_SlideFromUp contentView:self.qzoneView];
    popView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
}

- (IBAction)customLeftClick:(id)sender {
    PopView *popView = [PopView showSidePopDirect:PopViewDirection_SlideFromLeft contentView:self.sideLeftView];
    popView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    
}
- (IBAction)customDownClick:(id)sender {
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


- (IBAction)downClick:(id)sender {
    PopView *popView = [PopView showPopViewDirect:PopViewDirection_Bottom onView:sender contentView:self.popContentView];
    popView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
}

- (IBAction)rightClick:(id)sender {
    UIImageView *triangleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"elementSelect_icon"]];
    triangleView.bounds = CGRectMake(0, 0, triangleView.image.size.width*1.5, triangleView.image.size.height*1.5);
    self.popContentView.backgroundColor = [UIColor whiteColor];
    PopView *popView = [PopView showPopViewDirect:PopViewDirection_Right onView:sender contentView:self.popContentView offSet:60 triangleView:triangleView];
    popView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
}

- (IBAction)upClick:(id)sender {
    [PopView showPopViewDirect:PopViewDirection_Top onView:sender contentView:self.popContentView offSet:0 triangleView:nil];
}

- (IBAction)leftClick:(id)sender {
    PopView *popView = [PopView showPopViewDirect:PopViewDirection_Left onView:sender contentView:self.popContentView offSet:0 triangleView:nil];
    popView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
}
- (IBAction)midClick:(id)sender {
    PopView *popView = [PopView showPopViewDirect:PopViewDirection_None onView:nil contentView:self.midContentView offSet:0 triangleView:nil animation:YES];
    popView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    popView.clickOutHidden = NO;
}


- (UIView *)midContentView{
    if (_midContentView == nil) {
        _midContentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
        
        UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 295, 200)];
        [_midContentView addSubview:contentView];
        contentView.backgroundColor = [UIColor yellowColor];
        
        UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_midContentView addSubview:closeBtn];
        closeBtn.frame = CGRectMake(300, 0, 20, 20);
        closeBtn.backgroundColor = [UIColor whiteColor];
        [closeBtn setImage:[UIImage imageNamed:@"videoTip_close_button_vc"] forState:UIControlStateNormal];
        [closeBtn addTarget:self action:@selector(closePopView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _midContentView;
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
- (PopTableListView *)popListView{
    if (_popListView == nil) {
        _popListView = [[PopTableListView alloc] initWithFrame:CGRectMake(0, 0, 150, 200)];
        _popListView.backgroundColor = [UIColor redColor];
        _popListView.layer.cornerRadius = 5;
    }
    return _popListView;
}

@end
