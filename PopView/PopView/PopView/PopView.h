//
//  PopView.h
//  iPad-Education
//
//  Created by 李林 on 2017/10/18.
//  Copyright © 2017年 iLaihua. All rights reserved.
//

#import <UIKit/UIKit.h>

static  CGFloat   const animationDuration       = 0.25;
static  CGFloat   const popViewInsert           = 5;

typedef NS_OPTIONS(NSUInteger, PopViewDirection) {
    PopViewDirection_Left,
    PopViewDirection_Bottom,
    PopViewDirection_Right,
    PopViewDirection_Top,
    PopViewDirection_None,


    
    PopViewDirection_SlideFromLeft                 = 20,
    PopViewDirection_SlideFromRight                = 21,
    PopViewDirection_SlideFromUp                   = 22,
    PopViewDirection_SlideFromBottom               = 23,
    PopViewDirection_SlideInCenter                 = 24,


};

@interface PopView : UIView
@property (nonatomic ,assign) BOOL clickOutHidden;    //default to yes
@property (nonatomic ,weak) UIView *responseOnView;   //设置后事件会透过去,响应该view上的事件
@property (nonatomic ,assign) CGFloat keyBoardMargin; //默认为10px
@property (nonatomic ,strong) UIView *popContainerView;
@property (nonatomic ,copy) void(^clickOutHidenComplete)(void);


+ (instancetype)popContentView:(UIView *)contentView
                        direct:(PopViewDirection)direct
                        onView:(UIView *)onView;

+ (instancetype)popContentView:(UIView *)contentView
                        direct:(PopViewDirection)direct
                        onView:(UIView *)onView
                        offset:(CGFloat)offset
                  triangleView:(UIView *)triangleView
                     animation:(BOOL)animation;



+ (instancetype)showSidePopDirect:(PopViewDirection)direction
                      contentView:(UIView *)contentView;



+ (instancetype)showPopContentView:(UIView *)contentView
                     showAnimation:(CABasicAnimation *)showAnimation
                    hidenAnimation:(CABasicAnimation *)hidenAnimation;


+ (void)hidenPopView;

+ (instancetype)getCurrentPopView;
@end

