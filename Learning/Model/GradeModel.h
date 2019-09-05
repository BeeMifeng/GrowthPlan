//
//  GradeModel.h
//  GrowthPlan
//
//  Created by lijialun on 2019/4/10.
//  Copyright © 2019年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <NSObject+YYModel.h>
NS_ASSUME_NONNULL_BEGIN

@interface GradeModel : NSObject
@property (assign, nonatomic) int classId;
@property (assign, nonatomic) BOOL exist;
@property (copy,   nonatomic) NSString *className;
@end

NS_ASSUME_NONNULL_END
