//
//  NetWorkManager.m
//  GrowthPlan
//
//  Created by lijialun on 2019/4/2.
//  Copyright © 2019年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "NetWorkManager.h"
#import "AFNetworking.h"
#import "SVProgressHUD.h"
@interface NetWorkManager()
@property(nonatomic,strong)AFHTTPSessionManager *sessionManeger;
@end

static NetWorkManager *manager = nil;
@implementation NetWorkManager
+(instancetype)shareNetWorkManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[NetWorkManager alloc]init];
    });
    return manager;
}

-(AFHTTPSessionManager *)sessionManeger {
    if (_sessionManeger == nil) {
        _sessionManeger = [AFHTTPSessionManager manager];
        _sessionManeger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",nil];
        _sessionManeger.responseSerializer = [AFJSONResponseSerializer serializer];
        _sessionManeger.requestSerializer.stringEncoding = NSUTF8StringEncoding;
        _sessionManeger.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    return _sessionManeger;
}

- (void)requestDataWithUrl:(NSString*)urlString andMethod:(Method)method andParams:(NSDictionary *)paramsDic andSuccessCallBack:(void (^)(id _Nonnull responseObject))successCallBack andFailCallBack:(void (^)(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error))failCallBack {
    
    switch (method) {
        case GET:{
            [self.sessionManeger GET:urlString parameters:paramsDic progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                successCallBack(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                failCallBack(task,error);
            }];
        }
        break;
            
        case POST:{
            [self.sessionManeger POST:urlString parameters:paramsDic progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                successCallBack(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                failCallBack(task,error);
            }];
        }
        break;
        default:
            break;
    }
    
}

//开始监听网络环境
-(void)startMonitoring {
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未识别的网络");
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
                {
                    [SVProgressHUD showInfoWithStatus:@"当前网络不佳,或不可用"];
                }
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"2G,3G,4G...的网络");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"wifi的网络");
                break;
            default:
                break;
        }
        
    }];
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}
@end
