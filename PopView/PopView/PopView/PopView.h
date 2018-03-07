//
//  PopView.h
//  iPad-Education
//
//  Created by 李林 on 2017/10/18.
//  Copyright © 2017年 iLaihua. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, PopViewDirection) {
    PopViewDirection_Left               = 5,
    PopViewDirection_Bottom             = 6,
    PopViewDirection_Right              = 7,
    PopViewDirection_Top                = 8,
    PopViewDirection_None               = 9,
    
    
    
    PopViewDirection_SlideFromLeft                 = 10,
    PopViewDirection_SlideFromRight                = 11,
    PopViewDirection_SlideFromUp                   = 12,
    PopViewDirection_SlideFromBottom               = 13,
};

@interface PopView : UIView
@property (nonatomic ,assign) BOOL clickOutHidden;
@property (nonatomic ,weak) UIView *responseOnView;
@property (nonatomic ,assign) CGFloat keyBoardMargin;
@property (nonatomic ,strong) UIView *popContainerView;
@property (nonatomic ,copy) void(^clickOutHidenComplete)(void);

+(instancetype)showPopViewDirect:(PopViewDirection)direction
                          onView:(UIView *)onView
                     contentView:(UIView *)contentView;


+(instancetype)showPopViewDirect:(PopViewDirection)direction
                          onView:(UIView *)onView
                     contentView:(UIView *)contentView
                          offSet:(CGFloat)offset
                    triangleView:(UIView *)triangleView;


+ (instancetype)showPopViewDirect:(PopViewDirection)direct
                           onView:(UIView *)onView
                      contentView:(UIView *)contentView
                           offSet:(CGFloat)offset
                     triangleView:(UIView *)triangleView
                        animation:(BOOL)animation;


+ (instancetype)showSidePopDirect:(PopViewDirection)direction
                      contentView:(UIView *)contentView;



+ (instancetype)showPopSideContentView:(UIView *)contentView
                    showAnimation:(CABasicAnimation *)showAnimation
                   hidenAnimation:(CABasicAnimation *)hidenAnimation;


+ (void)hidenPopView;

+ (instancetype)getCurrentPopView;
@end

