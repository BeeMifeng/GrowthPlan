//
//  KnowledgeModel.h
//  GrowthPlan
//
//  Created by 李嘉伦 on 2019/12/2.
//  Copyright © 2019 lijialun.develop.GrowthPlan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KnowledgeModel : NSObject
@property(nonatomic,copy)NSString *knowledgeId;
@property(nonatomic,copy)NSString *projectId;
@property(nonatomic,copy)NSString *projectName;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *readCount;
@property(nonatomic,copy)NSString *createTime;
@end

NS_ASSUME_NONNULL_END
