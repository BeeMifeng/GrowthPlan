//
//  GrowthPlanCatch.h
//  GrowthPlan
//
//  Created by lijialun on 2019/4/8.
//  Copyright © 2019年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GrowthPlanCatch : NSObject
//请求省份 和 年级数据  写入缓存
+(void)loadProvinceAndGrade:(void(^)(id responseObject))sucessCallBack fail:(void(^)(NSError * _Nonnull error))failCallBack;
@end

NS_ASSUME_NONNULL_END
