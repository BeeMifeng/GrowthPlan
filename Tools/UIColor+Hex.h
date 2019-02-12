//
//  UIColor+Hex.h
//  GrowthPlan
//
//  Created by 王政 on 2018/12/26.
//  Copyright © 2018年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Hex)
//16进制颜色
+(UIColor *)colorFromHex:(int)hexNumber alpha:(CGFloat)alpha;

+(UIColor*)GPBarTitleColor;

+(UIColor*)GPTextTitleColor;

+(UIColor*)GPTextThePaperColor;

+(UIColor*)GPTextTheTimeColor;

+(UIColor*)GPblack;
@end

NS_ASSUME_NONNULL_END
