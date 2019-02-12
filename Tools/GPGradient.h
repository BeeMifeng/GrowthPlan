//
//  GPGradient.h
//  GrowthPlan
//
//  Created by 王政 on 2018/12/28.
//  Copyright © 2018年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GPGradient : NSObject
+ (CAGradientLayer *)setGradualChangingColor:(UIView *)view fromColor:(int )fromHexColor toColor:(int)toHexColor;

+(CAGradientLayer *)setGradualColor:(CGRect)frame fromColor:(int )fromHexColor toColor:(int)toHexColor;
@end

NS_ASSUME_NONNULL_END
