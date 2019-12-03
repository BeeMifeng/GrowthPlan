//
//  MoreProController.h
//  GrowthPlan
//
//  Created by lijialun on 2019/4/11.
//  Copyright © 2019年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "GPController.h"
typedef void(^updateProject)(NSArray* _Nullable projectArr);
NS_ASSUME_NONNULL_BEGIN

@interface MoreProController : GPController
@property(nonatomic,copy)updateProject updateBlock;
@end

NS_ASSUME_NONNULL_END
