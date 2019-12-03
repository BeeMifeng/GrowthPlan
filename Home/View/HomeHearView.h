//
//  HomeHearView.h
//  GrowthPlan
//
//  Created by 王政 on 2018/12/27.
//  Copyright © 2018年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HomeHearViewDelegate <NSObject>

-(void)didSelectedContectUs:(UIView*)view;

-(void)startSearch:(NSString*)searchText;

@end

@interface HomeHearView : UIView
@property(nonatomic,weak)id <HomeHearViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
