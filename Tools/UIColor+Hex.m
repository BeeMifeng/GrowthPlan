//
//  UIColor+Hex.m
//  GrowthPlan
//
//  Created by 王政 on 2018/12/26.
//  Copyright © 2018年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)
+(UIColor *)colorFromHex:(int)hexNumber alpha:(CGFloat)alpha{
    
    if (hexNumber > 0xFFFFFF) return nil;
    
    CGFloat red   = ((hexNumber >> 16) & 0xFF) / 255.0;
    CGFloat green = ((hexNumber >> 8) & 0xFF) / 255.0;
    CGFloat blue  = (hexNumber & 0xFF) / 255.0;
    
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    
    return color;
}


+(UIColor*)GPBarTitleColor {
    return [UIColor colorFromHex:0x487CFB alpha:1.0];
}

+(UIColor*)GPTextTitleColor {
    return [UIColor colorFromHex:0xbcbcbc alpha:1.0];
}
+(UIColor*)GPTextThePaperColor {
    return [UIColor colorFromHex:0x666666 alpha:1.0];
}

+(UIColor*)GPTextTheTimeColor {
    return [UIColor colorFromHex:0x999999 alpha:1.0];
}

+(UIColor*)GPblack {
    return [UIColor colorFromHex:0x333333 alpha:1.0];
}

@end
