//
//  TableCell.h
//  GrowthPlan
//
//  Created by 王政 on 2019/1/2.
//  Copyright © 2019年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlanModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TableCell : UITableViewCell
-(void)refreshBackColor:(NSInteger)index;
-(void)refreshUI:(PlanModel*)model;
@end

NS_ASSUME_NONNULL_END
