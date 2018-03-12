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

typedef NS_ENUM(NSUInteger, PopViewDirection) {
    PopViewDirection_PopUpLeft,
    PopViewDirection_PopUpBottom,
    PopViewDirection_PopUpRight,
    PopViewDirection_PopUpTop,
    PopViewDirection_PopUpNone,


    
    PopViewDirection_SlideFromLeft                 = 20,
    PopViewDirection_SlideFromRight                = 21,
    PopViewDirection_SlideFromUp                   = 22,
    PopViewDirection_SlideFromBottom               = 23,
    PopViewDirection_SlideInCenter                 = 24,
    PopViewDirection_SlideBelowView                = 25,
};

@interface PopView : UIView
@property (nonatomic ,assign) BOOL clickOutHidden;      //点击除了popContainerView的其他地方是否消失default to yes
@property (nonatomic ,weak) UIView *responseOnView;     //设置后事件会透过去,响应该view上的事件
@property (nonatomic ,assign) CGFloat keyBoardMargin;   //输入框与键盘的间隔,默认为10px
@property (nonatomic ,strong) UIView *popContainerView; //包含要显示的View的父控件

//popView的移除回调
@property (nonatomic ,copy) void(^willRemovedFromeSuperView)(void);
@property (nonatomic ,copy) void(^didRemovedFromeSuperView)(void);




/*
 1、可自定义显示隐藏动画
 @param contentView 要显示的控件内容
 @param showAnimation 显示动画
 @param hidenAnimation 消失动画
 **/
+ (instancetype)popContentView:(UIView *)contentView
                 showAnimation:(CABasicAnimation *)showAnimation
                hidenAnimation:(CABasicAnimation *)hidenAnimation;


/*
 2、可实现类似QQ和微信消息页面的右上角微型菜单弹窗
 @param contentView 要显示的控件内容
 @param direct 方向
 @param onView 一般是响应事件的按钮
 **/
+ (instancetype)popUpContentView:(UIView *)contentView
                          direct:(PopViewDirection)direct
                          onView:(UIView *)onView;

/*
 3、可实现类似QQ和微信消息页面的右上角微型菜单弹窗
 @param contentView 要显示的控件内容
 @param direct 方向
 @param onView 一般是响应事件的按钮
 @param offset 一般是响应事件的按钮
 @param triangleView 可以自定义的任意的view来替代三角指示控件
 @param animation 是否动画
 **/
+ (instancetype)popUpContentView:(UIView *)contentView
                          direct:(PopViewDirection)direct
                          onView:(UIView *)onView
                          offset:(CGFloat)offset
                    triangleView:(UIView *)triangleView
                       animation:(BOOL)animation;

/*
 4、从屏幕外显示出控件
 @param contentView 要显示的控件内容
 @param contentView 方向
 **/
+ (instancetype)popSideContentView:(UIView *)contentView
                            direct:(PopViewDirection)direction;

/*
 5、可实现DropDownMunu类型的动画
 @param contentView 要显示的控件内容
 @param belowView   内容在belowView的下方,整个控件是添加到belowView的superview上的
 **/
+ (instancetype)popSideContentView:(UIView *)contentView
                         belowView:(UIView *)belowView;


//隐藏当前的popView
+ (void)hidenPopView;

//获取当前的popView
+ (instancetype)getCurrentPopView;
@end

