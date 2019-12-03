//
//  PlanModel.h
//  GrowthPlan
//
//  Created by 李嘉伦 on 2019/12/3.
//  Copyright © 2019 lijialun.develop.GrowthPlan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <NSObject+YYModel.h>
NS_ASSUME_NONNULL_BEGIN

@interface PlanModel : NSObject
@property(nonatomic,copy)NSString *planMonth;
@property(nonatomic,copy)NSString *content;
@end

NS_ASSUME_NONNULL_END
