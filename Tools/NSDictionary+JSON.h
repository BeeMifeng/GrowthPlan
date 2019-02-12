//
//  NSDictionary+JSON.h
//  GrowthPlan
//
//  Created by 王政 on 2019/1/2.
//  Copyright © 2019年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (JSON)
+ (NSDictionary *)readLocalFileWithName:(NSString *)name;
@end

NS_ASSUME_NONNULL_END
