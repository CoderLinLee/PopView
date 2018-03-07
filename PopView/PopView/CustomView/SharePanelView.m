//
//  SharePanelView.m
//  PopView
//
//  Created by apple on 2018/2/28.
//  Copyright © 2018年 李林. All rights reserved.
//

#import "SharePanelView.h"
#import "YLButton.h"
#import "PopView.h"

@interface SharePanelView()
@property (weak, nonatomic) IBOutlet YLButton *qqBtn;
@property (weak, nonatomic) IBOutlet YLButton *weichatBtn;
@property (weak, nonatomic) IBOutlet YLButton *weiboBtn;

@end
@implementation SharePanelView
- (IBAction)cancelBtnClick:(id)sender {
    [PopView hidenPopView];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.qqBtn setImageRect:CGRectMake(10, 10, 50, 50)];
    [self.qqBtn setTitleRect:CGRectMake(0, 60, 60, 20)];
    self.qqBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.weichatBtn setImageRect:CGRectMake(10, 10, 50, 50)];
    [self.weichatBtn setTitleRect:CGRectMake(0, 60, 60, 20)];
    self.weichatBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    
    [self.weiboBtn setImageRect:CGRectMake(10, 10, 50, 50)];
    [self.weiboBtn setTitleRect:CGRectMake(0, 60, 60, 20)];
    self.weiboBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
}
@end
