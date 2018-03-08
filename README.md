# PopView
## 弹出自定义视图控件,使用简单,耦合度小(popView)

### 1、类似QQ和微信消息页面的右上角微型菜单弹窗
~~~
PopView *popView = [PopView showPopViewDirect:PopViewDirection_Bottom onView:sender contentView:self.popContentView];
popView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
~~~

![img](https://github.com/xiaohu036/PopView/blob/master/1.gif)




### 2、侧边栏(处理了键盘遮挡的问题)
~~~
PopView *popView = [PopView showSidePopDirect:PopViewDirection_SlideFromUp contentView:self.qzoneView];
popView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
~~~
![img](https://github.com/xiaohu036/PopView/blob/master/2.gif)




### 3、自定义显示和隐藏动画
~~~
CABasicAnimation *showAnima = [CABasicAnimation animationWithKeyPath:@"transform"];
showAnima.duration = 0.25;
showAnima.fillMode = kCAFillModeForwards;
showAnima.removedOnCompletion = YES;
CATransform3D tofrom = CATransform3DMakeScale(1, 1, 1);
CATransform3D from = CATransform3DMakeScale(0, 0, 1);
showAnima.fromValue = [NSValue valueWithCATransform3D:from];
showAnima.toValue =  [NSValue valueWithCATransform3D:tofrom];


CABasicAnimation *hidenAnima = [CABasicAnimation animationWithKeyPath:@"transform"];
hidenAnima.duration = 0.25;
hidenAnima.fillMode = kCAFillModeForwards;
CATransform3D tofrom1 = CATransform3DMakeScale(1, 0, 1);
CATransform3D from1 = CATransform3DMakeScale(1, 1, 1);
hidenAnima.fromValue = [NSValue valueWithCATransform3D:from1];
hidenAnima.toValue =  [NSValue valueWithCATransform3D:tofrom1];

self.loginView.center = self.view.center;
self.loginView.backgroundColor = [UIColor whiteColor];
PopView *popView = [PopView showPopContentView:self.loginView showAnimation:showAnima hidenAnimation:hidenAnima];
popView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
popView.clickOutHidden = NO;

~~~
![img](https://github.com/xiaohu036/PopView/blob/master/3.gif)




