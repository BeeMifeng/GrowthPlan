//
//  SginModel.h
//  GrowthPlan
//
//  Created by 李嘉伦 on 2019/12/3.
//  Copyright © 2019 lijialun.develop.GrowthPlan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <NSObject+YYModel.h>
NS_ASSUME_NONNULL_BEGIN

@interface SginModel : NSObject
@property(nonatomic,copy)NSString *signFlag;
@property(nonatomic,copy)NSString *overFlag;
@property(nonatomic,copy)NSString *month;
@property(nonatomic,copy)NSString *day;
@end

NS_ASSUME_NONNULL_END
