//
//  YLButton.h
//  iPad-Education
//
//  Created by Sumbo on 2017/10/19.
//  Copyright © 2017年 iLaihua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YLButton : UIButton
/*
 *提示：先设置titleRect和imageRect，再设置frame，否则iOS9.0会有布局问题
 */
@property (nonatomic,assign) CGRect titleRect;
@property (nonatomic,assign) CGRect imageRect;
@end
