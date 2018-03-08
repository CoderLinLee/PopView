//
//  PopAnimationTool.h
//  PopView
//
//  Created by 李林 on 2018/3/8.
//  Copyright © 2018年 李林. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PopView.h"

@interface PopAnimationTool : NSObject
+ (CABasicAnimation *)getShowPopAnimationWithType:(PopViewDirection)popDirecton contentView:(UIView *)contentView;
+ (CABasicAnimation *)getHidenPopAnimationWithType:(PopViewDirection)popDirecton contentView:(UIView *)contentView;
@end
