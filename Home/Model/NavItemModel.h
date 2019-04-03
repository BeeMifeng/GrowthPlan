//
//  NavItemModel.h
//  GrowthPlan
//
//  Created by lijialun on 2019/4/2.
//  Copyright © 2019年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <NSObject+YYModel.h>
NS_ASSUME_NONNULL_BEGIN

@interface NavItemModel : NSObject
@property (copy,   nonatomic) NSString *name;
@property (assign, nonatomic) int personId;
@property (copy,   nonatomic) NSString *iconUrl;
@end

NS_ASSUME_NONNULL_END
