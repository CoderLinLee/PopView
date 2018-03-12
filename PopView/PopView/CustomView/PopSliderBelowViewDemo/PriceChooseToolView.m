//
//  PriceChooseToolView.m
//  PopView
//
//  Created by 李林 on 2018/3/9.
//  Copyright © 2018年 李林. All rights reserved.
//

#import "PriceChooseToolView.h"
@interface PriceChooseToolView()
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;

@end
@implementation PriceChooseToolView

- (void)awakeFromNib{
    [super awakeFromNib];
    self.sureBtn.layer.cornerRadius = 2;
}

@end
