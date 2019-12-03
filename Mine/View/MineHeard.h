//
//  MineHeard.h
//  GrowthPlan
//
//  Created by 王政 on 2019/1/3.
//  Copyright © 2019年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MineHeardDelegate <NSObject>

-(void)didTouchHearView:(UIImageView*_Nullable)heardView;
-(void)didTouchEditView:(UIView*_Nullable)view;

@end

NS_ASSUME_NONNULL_BEGIN

@interface MineHeard : UIView
@property(nonatomic,weak)id <MineHeardDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
