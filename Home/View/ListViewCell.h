//
//  ListViewCell.h
//  GrowthPlan
//
//  Created by 王政 on 2018/12/28.
//  Copyright © 2018年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeArticle.h"
NS_ASSUME_NONNULL_BEGIN

@interface ListViewCell : UITableViewCell
-(void)refreshUI:(HomeArticle*)model;
@end

NS_ASSUME_NONNULL_END
