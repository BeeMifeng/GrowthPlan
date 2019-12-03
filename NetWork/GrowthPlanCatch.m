//
//  GrowthPlanCatch.m
//  GrowthPlan
//
//  Created by lijialun on 2019/4/8.
//  Copyright © 2019年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "GrowthPlanCatch.h"
#import "NetWorkManager.h"
#import "SVProgressHUD.h"
@implementation GrowthPlanCatch
+(void)loadProvinceAndGrade:(void (^)(id _Nonnull))sucessCallBack fail:(void(^)(NSError * _Nonnull error))failCallBack {
    [[NetWorkManager shareNetWorkManager] requestDataWithUrl:[NSString stringWithFormat:@"%@%@",gp_address_app,gp_province_grade] andMethod:GET andParams:@{@"":@""} andSuccessCallBack:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] isEqualToString:@"0"]) {
            NSData *data = [NSJSONSerialization dataWithJSONObject:responseObject[@"data"] options:0 error:nil];
            [data writeToFile:gp_province_grade_info atomically:YES];
        }
    } andFailCallBack:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
    }];
}
@end
