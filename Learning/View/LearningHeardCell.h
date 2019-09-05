//
//  LearningHeardCell.h
//  GrowthPlan
//
//  Created by 王政 on 2018/12/28.
//  Copyright © 2018年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LearningHeardCellDelegate <NSObject>
-(void)didClickMoreBtn;
-(void)didClickCutGrade;
@end

@interface LearningHeardCell : UITableViewCell
@property(nonatomic,strong)NSArray *itemArr;
@property(nonatomic,weak)id <LearningHeardCellDelegate>delegate;

-(void)refreshData:(NSArray*)disciplineArr and:(NSString*)currentGrade;

-(void)refreshDiscipline:(NSArray*)disciplineArr;

-(void)refreshCurrentGrade:(NSString*)currentGrade;
@end

NS_ASSUME_NONNULL_END
