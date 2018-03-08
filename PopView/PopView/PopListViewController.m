//
//  PopListViewController.m
//  PopView
//
//  Created by 李林 on 2018/3/8.
//  Copyright © 2018年 李林. All rights reserved.
//

#import "PopListViewController.h"
#import "PopView.h"
#import "PopTableListView.h"

@interface PopListViewController ()
@property (nonatomic ,strong) UIView *midContentView;
@property (nonatomic ,strong) PopTableListView *popListView;
@end

@implementation PopListViewController

#define popColor [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0]
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"可设置任意View";
    
}

- (void)closePopView{
    [PopView hidenPopView];
}

- (IBAction)downClick:(id)sender {
    PopView *popView = [PopView popContentView:self.popListView direct:PopViewDirection_Bottom onView:sender];
    popView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
}

- (IBAction)rightClick:(id)sender {
    UIImageView *triangleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"elementSelect_icon"]];
    triangleView.bounds = CGRectMake(0, 0, triangleView.image.size.width*1.5, triangleView.image.size.height*1.5);
    PopView *popView = [PopView popContentView:self.popListView direct:PopViewDirection_Right onView:sender offset:60 triangleView:triangleView animation:YES];
    popView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    self.popListView = nil;
}

- (IBAction)upClick:(id)sender {
    [PopView popContentView:self.popListView direct:PopViewDirection_Top onView:sender];
}

- (IBAction)leftClick:(id)sender {
    PopView *popView = [PopView popContentView:self.popListView direct:PopViewDirection_Left onView:sender];
    popView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
}

- (IBAction)midClick:(id)sender {
    PopView *popView = [PopView popContentView:self.midContentView direct:PopViewDirection_None onView:sender];
    popView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    popView.clickOutHidden = NO;
}

- (PopTableListView *)popListView{
    if (_popListView == nil) {
        _popListView = [[PopTableListView alloc] initWithTitles:@[@"扫一扫",@"加好友",@"收付款",@"删除"] imgNames:@[@"saoyisao_icon",@"addFriend_icon",@"payMoney_icon",@"delete_icon"]];
        _popListView.backgroundColor = popColor;
        _popListView.layer.cornerRadius = 5;
    }
    return _popListView;
}

- (UIView *)midContentView{
    if (_midContentView == nil) {
        _midContentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 265, 300)];
        
        UIImageView *contentView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 15, 250, 285)];
        [_midContentView addSubview:contentView];
        contentView.backgroundColor = [UIColor yellowColor];
        [contentView setImage:[UIImage imageNamed:@"liudehua.jpg"]];
        
        UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_midContentView addSubview:closeBtn];
        closeBtn.frame = CGRectMake(230, 0, 30, 30);
        closeBtn.backgroundColor = [UIColor whiteColor];
        closeBtn.layer.cornerRadius = 5;
        [closeBtn setImage:[UIImage imageNamed:@"videoTip_close_button_vc"] forState:UIControlStateNormal];
        [closeBtn addTarget:self action:@selector(closePopView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _midContentView;
}
@end
