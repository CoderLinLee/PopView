# PopView
## 弹出自定义视图控件,使用简单,耦合度小

![img](https://github.com/xiaohu036/PopView/blob/master/1.gif)

处理了键盘遮挡的问题
![img](https://github.com/xiaohu036/PopView/blob/master/2.gif)

### 第一个图的使用方法
~~~
PopView *popView = [PopView showPopViewDirect:PopViewDirection_Bottom onView:sender contentView:self.popContentView];
popView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
~~~

### 第二个图的使用方法
~~~
PopView *popView = [PopView showSidePopDirect:PopViewDirection_SlideFromUp contentView:self.qzoneView];
popView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
~~~

#### 自定义显示和隐藏动画
~~~
CGFloat SWidth = self.view.bounds.size.width;
CGFloat SHeight = self.view.bounds.size.height;
CGFloat height = 250;
CGPoint locationPoint = CGPointMake(SWidth/2, SHeight/2+100);

CABasicAnimation *showAnima = [CABasicAnimation animationWithKeyPath:@"position"];
showAnima.duration = 0.25;
showAnima.fillMode = kCAFillModeForwards;
showAnima.fromValue = [NSValue valueWithCGPoint:CGPointMake(SWidth/2, -height/2)];
showAnima.toValue = [NSValue valueWithCGPoint:locationPoint];
showAnima.removedOnCompletion = YES;


CABasicAnimation *hidenAnima = [CABasicAnimation animationWithKeyPath:@"position"];
hidenAnima.duration = 0.25;
hidenAnima.fillMode = kCAFillModeForwards;
hidenAnima.fromValue = [NSValue valueWithCGPoint:locationPoint];
hidenAnima.toValue = [NSValue valueWithCGPoint:CGPointMake(SWidth/2, SHeight+height/2)];


self.loginView.center = locationPoint;
self.loginView.backgroundColor = [UIColor whiteColor];
PopView *popView = [PopView showPopSideContentView:self.loginView showAnimation:showAnima hidenAnimation:hidenAnima];
popView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
popView.clickOutHidden = NO;
~~~




