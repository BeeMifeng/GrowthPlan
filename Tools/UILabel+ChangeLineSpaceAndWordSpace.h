//
//  UILabel+ChangeLineSpaceAndWordSpace.h
//  GrowthPlan
//
//  Created by 王政 on 2018/12/28.
//  Copyright © 2018年 lijialun.develop.GrowthPlan. All rights reserved.
//



NS_ASSUME_NONNULL_BEGIN

@interface UILabel (ChangeLineSpaceAndWordSpace)
/**
 *  改变行间距
 */
+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变字间距
 */
+ (void)changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变行间距和字间距
 */
+ (void)changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace;

/**
 *  首行缩进
 */

+ (NSAttributedString *)setLabelIndent:(CGFloat)indent text:(NSString *)text andLabel:(UILabel*)label;
@end

NS_ASSUME_NONNULL_END
