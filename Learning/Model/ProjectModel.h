//
//  ProjectModel.h
//  GrowthPlan
//
//  Created by lijialun on 2019/4/10.
//  Copyright © 2019年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <NSObject+YYModel.h>
NS_ASSUME_NONNULL_BEGIN

@interface ProjectModel : NSObject
@property (assign, nonatomic) int projectId;
@property (assign, nonatomic) int relationId;
@property (copy,   nonatomic) NSString *projectName;
@end

NS_ASSUME_NONNULL_END
