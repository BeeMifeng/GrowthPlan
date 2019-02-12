//
//  GPGradient.m
//  GrowthPlan
//
//  Created by 王政 on 2018/12/28.
//  Copyright © 2018年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "GPGradient.h"
#import "UIColor+Hex.h"
@implementation GPGradient

+ (CAGradientLayer *)setGradualChangingColor:(UIView *)view fromColor:(int )fromHexColor toColor:(int)toHexColor{
    
    //    CAGradientLayer类对其绘制渐变背景颜色、填充层的形状(包括圆角)
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = view.bounds;
    
//  创建渐变色数组，需要转换为CGColor颜色
    gradientLayer.colors = @[(__bridge id)[UIColor colorFromHex:fromHexColor alpha:1.0].CGColor,(__bridge id)[UIColor colorFromHex:toHexColor alpha:1.0].CGColor];
    
    //  设置渐变颜色方向，左上点为(0,0), 右下点为(0,1)
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 0);
    
    //  设置颜色变化点，取值范围 0.0~1.0
    gradientLayer.locations = @[@0,@1];
    
    return gradientLayer;
}


+ (CAGradientLayer *)setGradualColor:(CGRect)frame fromColor:(int )fromHexColor toColor:(int)toHexColor{
    //    CAGradientLayer类对其绘制渐变背景颜色、填充层的形状(包括圆角)
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = frame;
    //  创建渐变色数组，需要转换为CGColor颜色
    gradientLayer.colors = @[(__bridge id)[UIColor colorFromHex:fromHexColor alpha:1.0].CGColor,(__bridge id)[UIColor colorFromHex:toHexColor alpha:1.0].CGColor];
    
    //  设置渐变颜色方向，左上点为(0,0), 右下点为(0,1)
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 0);
    
    //  设置颜色变化点，取值范围 0.0~1.0
    gradientLayer.locations = @[@0,@1];
    
    return gradientLayer;
}


@end
