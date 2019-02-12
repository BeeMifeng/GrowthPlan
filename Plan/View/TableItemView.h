//
//  TableItemView.h
//  GrowthPlan
//
//  Created by 王政 on 2018/12/29.
//  Copyright © 2018年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableItemView : UIView
-(void)setLeftImg:(NSString *)leftImgName andRightImg:(NSString*)rightImgName andKey:(NSString*)key andValue:(NSString*)value;
@end

NS_ASSUME_NONNULL_END
