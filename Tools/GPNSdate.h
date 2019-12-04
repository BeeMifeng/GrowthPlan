//
//  GPNSdate.h
//  GrowthPlan
//
//  Created by 李嘉伦 on 2019/12/2.
//  Copyright © 2019 lijialun.develop.GrowthPlan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GPNSdate : NSObject
+(NSString*)getCurretYear;


//计算字符串高度
+ (CGFloat)getStringHeightWithText:(NSString *)text font:(UIFont *)font viewWidth:(CGFloat)width;
@end

NS_ASSUME_NONNULL_END
