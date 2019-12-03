//
//  GPController.h
//  GrowthPlan
//
//  Created by 王政 on 2018/12/26.
//  Copyright © 2018年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GPController : UIViewController
-(UIView*)getStatusBar;
-(void)setStatueBackColor:(UIColor*)bColor andTextColor:(UIStatusBarStyle)statue;
@end

NS_ASSUME_NONNULL_END
