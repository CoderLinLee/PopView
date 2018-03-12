//
//  PopAnimationTool.m
//  PopView
//
//  Created by 李林 on 2018/3/8.
//  Copyright © 2018年 李林. All rights reserved.
//

#import "PopAnimationTool.h"

@implementation PopAnimationTool
+ (CABasicAnimation *)getShowPopAnimationWithType:(PopViewDirection)popDirecton contentView:(UIView *)contentView belowView:(UIView *)belowView{
    CABasicAnimation *showAnima = [CABasicAnimation animation];
    showAnima.duration = animationDuration;
    showAnima.repeatCount = 1;
    showAnima.fillMode = kCAFillModeForwards;
    showAnima.removedOnCompletion = YES;
    
    
    CGFloat width = contentView.bounds.size.width;
    CGFloat height = contentView.bounds.size.height;
    CGFloat ScreenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat ScreenHeight = [UIScreen mainScreen].bounds.size.height;
    
    switch (popDirecton) {
        case PopViewDirection_PopUpLeft:
        case PopViewDirection_PopUpRight:
        case PopViewDirection_PopUpTop:
        case PopViewDirection_PopUpBottom:
        case PopViewDirection_PopUpNone:{
            showAnima.keyPath = @"transform";
            CATransform3D tofrom = CATransform3DMakeScale(1, 1, 1);
            CATransform3D from = CATransform3DMakeScale(0, 0, 1);
            showAnima.fromValue = [NSValue valueWithCATransform3D:from];
            showAnima.toValue =  [NSValue valueWithCATransform3D:tofrom];
        }break;
        case PopViewDirection_SlideInCenter:{
            showAnima.keyPath = @"position";
            showAnima.fromValue = [NSValue valueWithCGPoint:CGPointMake(ScreenWidth/2, -height/2)];
            showAnima.toValue = [NSValue valueWithCGPoint:CGPointMake(ScreenWidth/2, ScreenHeight/2)];
            showAnima.removedOnCompletion = YES;
        }break;
        case PopViewDirection_SlideFromLeft:
            showAnima.keyPath = @"position";
            showAnima.fromValue = [NSValue valueWithCGPoint:CGPointMake(-width/2, ScreenHeight/2)];
            showAnima.toValue = [NSValue valueWithCGPoint:CGPointMake(width/2, ScreenHeight/2)];
            break;
        case PopViewDirection_SlideFromRight:
            showAnima.keyPath = @"position";
            showAnima.fromValue = [NSValue valueWithCGPoint:CGPointMake(ScreenWidth+width/2, ScreenHeight/2)];
            showAnima.toValue = [NSValue valueWithCGPoint:CGPointMake(ScreenWidth-width/2, ScreenHeight/2)];
            break;
        case PopViewDirection_SlideFromUp:
            showAnima.keyPath = @"position";
            showAnima.fromValue = [NSValue valueWithCGPoint:CGPointMake(ScreenWidth/2, -height/2)];
            showAnima.toValue = [NSValue valueWithCGPoint:CGPointMake(ScreenWidth/2, height/2)];
            break;
        case PopViewDirection_SlideFromBottom:
            showAnima.keyPath = @"position";
            showAnima.fromValue = [NSValue valueWithCGPoint:CGPointMake(ScreenWidth/2, ScreenHeight+height/2)];
            showAnima.toValue = [NSValue valueWithCGPoint:CGPointMake(ScreenWidth/2, ScreenHeight-height/2)];
            break;
        case PopViewDirection_SlideBelowView:
            showAnima.keyPath = @"position";
            showAnima.fromValue = [NSValue valueWithCGPoint:CGPointMake(belowView.bounds.size.width/2, -contentView.bounds.size.height/2)];
            showAnima.toValue = [NSValue valueWithCGPoint:CGPointMake(belowView.bounds.size.width/2, contentView.bounds.size.height/2)];
            break;
        default:
            break;
    }
    return showAnima;
}

+ (CABasicAnimation *)getHidenPopAnimationWithType:(PopViewDirection)popDirecton contentView:(UIView *)contentView belowView:(UIView *)belowView{
    CABasicAnimation *hidenAnima = [CABasicAnimation animation];
    hidenAnima.duration = animationDuration;
    hidenAnima.fillMode = kCAFillModeForwards;
    hidenAnima.removedOnCompletion = YES;
    hidenAnima.repeatCount = 1;
    
    CGFloat width = contentView.bounds.size.width;
    CGFloat height = contentView.bounds.size.height;
    CGFloat ScreenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat ScreenHeight = [UIScreen mainScreen].bounds.size.height;
    switch (popDirecton) {
        case PopViewDirection_PopUpLeft:
        case PopViewDirection_PopUpRight:
        case PopViewDirection_PopUpTop:
        case PopViewDirection_PopUpBottom:
        case PopViewDirection_PopUpNone:{
            hidenAnima.keyPath = @"transform";
            CATransform3D tofrom = CATransform3DMakeScale(0, 0, 1);
            CATransform3D from = CATransform3DMakeScale(1, 1, 1);
            hidenAnima.fromValue = [NSValue valueWithCATransform3D:from];
            hidenAnima.toValue =  [NSValue valueWithCATransform3D:tofrom];
        }break;
        case PopViewDirection_SlideInCenter:{
            hidenAnima.keyPath = @"position";
            hidenAnima.fromValue = [NSValue valueWithCGPoint:CGPointMake(ScreenWidth/2, ScreenHeight/2)];
            hidenAnima.toValue = [NSValue valueWithCGPoint:CGPointMake(ScreenWidth/2, ScreenHeight+height/2)];
        }break;
        case PopViewDirection_SlideFromLeft:
            hidenAnima.keyPath = @"position";
            hidenAnima.fromValue = [NSValue valueWithCGPoint:CGPointMake(width/2, ScreenHeight/2)];
            hidenAnima.toValue = [NSValue valueWithCGPoint:CGPointMake(-width/2, ScreenHeight/2)];
            break;
        case PopViewDirection_SlideFromRight:
            hidenAnima.keyPath = @"position";
            hidenAnima.fromValue = [NSValue valueWithCGPoint:CGPointMake(ScreenWidth-width/2, ScreenHeight/2)];
            hidenAnima.toValue = [NSValue valueWithCGPoint:CGPointMake(ScreenWidth+width/2, ScreenHeight/2)];
            break;
        case PopViewDirection_SlideFromUp:
            hidenAnima.keyPath = @"position";
            hidenAnima.fromValue = [NSValue valueWithCGPoint:CGPointMake(ScreenWidth/2, height/2)];
            hidenAnima.toValue = [NSValue valueWithCGPoint:CGPointMake(ScreenWidth/2, -height/2)];
            break;
        case PopViewDirection_SlideFromBottom:
            hidenAnima.keyPath = @"position";
            hidenAnima.fromValue = [NSValue valueWithCGPoint:CGPointMake(ScreenWidth/2, ScreenHeight-height/2)];
            hidenAnima.toValue = [NSValue valueWithCGPoint:CGPointMake(ScreenWidth/2, ScreenHeight+height/2)];
            break;
        case PopViewDirection_SlideBelowView:
            hidenAnima.keyPath = @"position";
            hidenAnima.fromValue = [NSValue valueWithCGPoint:CGPointMake(belowView.bounds.size.width/2, contentView.bounds.size.height/2)];
            hidenAnima.toValue = [NSValue valueWithCGPoint:CGPointMake(belowView.bounds.size.width/2, -contentView.bounds.size.height/2)];
        default:
            break;
    }
    return hidenAnima;
}


@end
