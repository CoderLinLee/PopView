//
//  QZoneView.m
//  PopView
//
//  Created by 李林 on 2018/3/1.
//  Copyright © 2018年 李林. All rights reserved.
//

#import "QZoneView.h"
#import "YLButton.h"
#import "PopView.h"

@interface QZoneView()
@property (weak, nonatomic) IBOutlet YLButton *photeBtn;
@property (weak, nonatomic) IBOutlet YLButton *videoBtn;
@property (weak, nonatomic) IBOutlet YLButton *signBtn;
@property (weak, nonatomic) IBOutlet YLButton *faceBtn;
@property (weak, nonatomic) IBOutlet YLButton *messageBtn;

@end
@implementation QZoneView
- (IBAction)closeBtnClick:(id)sender {
    [PopView hidenPopView];
}



- (void)layoutSubviews{
    [super layoutSubviews];
    [self.photeBtn setImageRect:CGRectMake(0, 0, 60, 60)];
    [self.photeBtn setTitleRect:CGRectMake(0, 60, 60, 20)];
    self.photeBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.photeBtn.imageView.contentMode = UIViewContentModeCenter;
    
    [self.videoBtn setImageRect:CGRectMake(0, 0, 60, 60)];
    [self.videoBtn setTitleRect:CGRectMake(0, 60, 60, 20)];
    self.videoBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.videoBtn.imageView.contentMode = UIViewContentModeCenter;

    
    [self.signBtn setImageRect:CGRectMake(0, 0, 60, 60)];
    [self.signBtn setTitleRect:CGRectMake(0, 60, 60, 20)];
    self.signBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.signBtn.imageView.contentMode = UIViewContentModeCenter;

    
    [self.faceBtn setImageRect:CGRectMake(0, 0, 60, 60)];
    [self.faceBtn setTitleRect:CGRectMake(0, 60, 60, 20)];
    self.faceBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.faceBtn.imageView.contentMode = UIViewContentModeCenter;

    
    [self.messageBtn setImageRect:CGRectMake(0, 0, 60, 60)];
    [self.messageBtn setTitleRect:CGRectMake(0, 60, 60, 20)];
    self.messageBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.messageBtn.imageView.contentMode = UIViewContentModeCenter;

}

@end
