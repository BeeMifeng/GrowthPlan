//
//  LearningMainCell.h
//  GrowthPlan
//
//  Created by 王政 on 2018/12/29.
//  Copyright © 2018年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KnowledgeModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface LearningMainCell : UITableViewCell
-(void)refreshUI:(KnowledgeModel*)model;
@end

NS_ASSUME_NONNULL_END
