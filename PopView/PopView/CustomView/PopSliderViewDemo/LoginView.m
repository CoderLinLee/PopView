//
//  LoginView.m
//  PopView
//
//  Created by apple on 2018/2/28.
//  Copyright © 2018年 李林. All rights reserved.
//

#import "LoginView.h"
#import "PopView.h"
#import "RegisterView.h"

@implementation LoginView
- (IBAction)closeClick:(id)sender {
    [PopView hidenPopView];
}
- (IBAction)forgetPWClick:(id)sender {
    RegisterView *registerView = [[NSBundle mainBundle] loadNibNamed:@"RegisterView" owner:nil options:nil].firstObject;
    registerView.center = self.center;
    PopView *popView = [PopView getCurrentPopView];
    [UIView transitionWithView:popView.popContainerView duration:0.65 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        [popView.popContainerView addSubview:registerView];
        [self removeFromSuperview];
    } completion:^(BOOL finished) {
    }];
}

@end
