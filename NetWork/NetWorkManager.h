//
//  NetWorkManager.h
//  GrowthPlan
//
//  Created by lijialun on 2019/4/2.
//  Copyright © 2019年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    GET = 0,
    POST
} Method;

@interface NetWorkManager : NSObject
+(instancetype)shareNetWorkManager;

-(void)startMonitoring;

- (void)requestDataWithUrl:(NSString*)urlString andMethod:(Method)method andParams:(NSDictionary *)paramsDic andSuccessCallBack:(void (^)(id _Nonnull responseObject))successCallBack andFailCallBack:(void (^)(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error))failCallBack;
@end

NS_ASSUME_NONNULL_END
