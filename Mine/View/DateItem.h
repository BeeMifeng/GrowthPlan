//
//  DateItem.h
//  GrowthPlan
//
//  Created by 王政 on 2019/1/3.
//  Copyright © 2019年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SginModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface DateItem : UIView
-(void)refreshUIWithSignMode:(SginModel*)model;
@end

NS_ASSUME_NONNULL_END
