//
//  MineViewItem.h
//  GrowthPlan
//
//  Created by 王政 on 2019/1/2.
//  Copyright © 2019年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MineViewItem : UIView
-(void)setLeftImg:(NSString *)leftImgName andRightImg:(NSString*)rightImgName andKey:(NSString*)key andValue:(NSString*)value;
@end

NS_ASSUME_NONNULL_END
