//
//  HouseConditionFilterView.m
//  PopView
//
//  Created by 李林 on 2018/3/9.
//  Copyright © 2018年 李林. All rights reserved.
//

#import "HouseConditionFilterView.h"
#import "YLButton.h"
#import "PopView.h"

#import "RegionChooseView.h"
#import "PriceChooseView.h"
#import "HouseChooseView.h"
#import "MoreChooseView.h"
#import "PopSliderBelowStaticVar.h"

@interface HouseConditionFilterView()
@property (weak, nonatomic) IBOutlet YLButton *regionBtn;
@property (weak, nonatomic) IBOutlet YLButton *priceBtn;
@property (weak, nonatomic) IBOutlet YLButton *houseNumBtn;
@property (weak, nonatomic) IBOutlet YLButton *moreBtn;


@property (strong, nonatomic) RegionChooseView *regionChooseView;
@property (strong, nonatomic) PriceChooseView *priceChooseView;
@property (strong, nonatomic) HouseChooseView *houseChooseView;
@property (strong, nonatomic) MoreChooseView *moreChooseView;
@property (strong, nonatomic) UIButton *currentSeletedBtn;

@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *linViewHeightConstraint;
@property (assign, nonatomic) BOOL initBtn;

@end

@implementation HouseConditionFilterView

#define conditionChooseViewHight 300
- (void)awakeFromNib{
    [super awakeFromNib];
    self.linViewHeightConstraint.constant = segmentingLineHeight;
    self.lineView.backgroundColor = segmentingLineColor;
    self.initBtn = NO;
    self.backgroundColor = [UIColor clearColor];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    if (!self.initBtn) {
        self.initBtn = YES;
        [self layoutBtn:self.regionBtn];
        [self layoutBtn:self.priceBtn];
        [self layoutBtn:self.houseNumBtn];
        [self layoutBtn:self.moreBtn];
    }
}

- (void)layoutBtn:(YLButton *)btn{
    [btn layoutIfNeeded];
    CGRect titleFrame = btn.titleLabel.frame;
    CGRect imageViewFrame = btn.imageView.frame;
    
    titleFrame.origin.x = imageViewFrame.origin.x;
    imageViewFrame.origin.x = CGRectGetMaxX(titleFrame);
    
    [btn setTitleRect:titleFrame];
    [btn setImageRect:imageViewFrame];
}

- (IBAction)regionBtnClick:(UIButton *)sender {
    [self btnClick:sender conditionView:self.regionChooseView];
}

- (IBAction)priceBtnClick:(UIButton *)sender {
    [self btnClick:sender conditionView:self.priceChooseView];
}

- (IBAction)houseNumBtnClick:(UIButton *)sender {
    [self btnClick:sender conditionView:self.houseChooseView];
}

- (IBAction)moreBtnClick:(UIButton *)sender {
    [self btnClick:sender conditionView:self.moreChooseView];
}

- (void)btnClick:(UIButton *)btn conditionView:(UIView *)conditionView{
    btn.selected = !btn.selected;
    if (btn.selected) {
        PopView *popView = [PopView popSideContentView:conditionView belowView:self ];
        popView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
        __weak typeof(self) weakSelf = self;
        [popView setWillRemovedFromeSuperView:^{
            weakSelf.currentSeletedBtn.selected = NO;
            weakSelf.currentSeletedBtn.imageView.transform = CGAffineTransformIdentity;
        }];
        [self showBtnAnimation:btn];
    }else{
        [PopView hidenPopView];
    }
}

- (void)showBtnAnimation:(UIButton *)btn{
    self.currentSeletedBtn = btn;
    CGAffineTransform transform = btn.selected ? CGAffineTransformRotate(btn.transform, M_PI) : CGAffineTransformIdentity;
    btn.imageView.transform = transform;
}

- (RegionChooseView *)regionChooseView{
    if (_regionChooseView == nil) {
        _regionChooseView = [[RegionChooseView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, conditionChooseViewHight)];
        _regionChooseView.backgroundColor = [UIColor whiteColor];
    }
    return _regionChooseView;
}

- (PriceChooseView *)priceChooseView{
    if (_priceChooseView == nil) {
        _priceChooseView = [[PriceChooseView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, conditionChooseViewHight)];
        _priceChooseView.backgroundColor = [UIColor whiteColor];
    }
    return _priceChooseView;
}

- (HouseChooseView *)houseChooseView{
    if (_houseChooseView == nil) {
        _houseChooseView = [[HouseChooseView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, conditionChooseViewHight)];
        _houseChooseView.backgroundColor = [UIColor whiteColor];
    }
    return _houseChooseView;
}

- (MoreChooseView *)moreChooseView{
    if (_moreChooseView == nil) {
        _moreChooseView = [[MoreChooseView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, [UIScreen mainScreen].bounds.size.height - CGRectGetMaxY(self.frame))];
        _moreChooseView.backgroundColor = [UIColor whiteColor];
    }
    return _moreChooseView;
}

@end
