//
//  RegisterView.m
//  PopView
//
//  Created by 李林 on 2018/3/7.
//  Copyright © 2018年 李林. All rights reserved.
//

#import "RegisterView.h"
#import "PopView.h"
#import "LoginView.h"

@implementation RegisterView
- (IBAction)backClick:(id)sender {
    LoginView *loginView = [[NSBundle mainBundle] loadNibNamed:@"LoginView" owner:nil options:nil].firstObject;
    loginView.center = self.center;
    PopView *popView = [PopView getCurrentPopView];
    [UIView transitionWithView:popView.popContainerView duration:0.65 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        [popView.popContainerView addSubview:loginView];
        [self removeFromSuperview];
    } completion:^(BOOL finished) {
    }];
    
}



@end
