//
//  GPUserCatch.m
//  GrowthPlan
//
//  Created by 李嘉伦 on 2019/12/4.
//  Copyright © 2019 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "GPUserCatch.h"
#import "MCFileManager.h"

@implementation GPUserCatch

+(BOOL)isLogin {
    NSDictionary *userDic = [MCFileManager dictionaryInPlistFileOfPath:gp_user_info];
    if (userDic) {
        return YES;
    }
    return NO;
}

+(NSString*)getBodyId {
    NSDictionary *userDic = [MCFileManager dictionaryInPlistFileOfPath:gp_user_info];
    if (userDic) {
        return userDic[@"user"][@"id"];
    }
    return @"";
}
@end
