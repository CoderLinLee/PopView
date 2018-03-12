//
//  MoreChooseView.h
//  PopView
//
//  Created by 李林 on 2018/3/9.
//  Copyright © 2018年 李林. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface MoreChooseItemModel:NSObject
@property(nonatomic ,copy) NSString *itemName;
@property(nonatomic ,assign) BOOL seleted;
@end

@interface MoreChooseDataModel:NSObject
@property(nonatomic ,copy) NSString *type;
@property(nonatomic ,assign) BOOL radio;
@property(nonatomic ,strong) NSArray<MoreChooseItemModel *> *items;
@end


@interface MoreChooseView : UIView
@end
