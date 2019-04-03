//
//  GPlabelView.h
//  GrowthPlan
//
//  Created by 王政 on 2019/1/14.
//  Copyright © 2019年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    PHONE_LABEL = 0,
    PASSWORLD_LABEL,
    EMAIL_LABEL,
    CODE_LABEL
} labelStyle;

@interface GPlabelView : UIView
@property(nonatomic,copy)NSString *GPtext;

-(instancetype)initWithIntroduce:(NSString*)intro andStyle:(labelStyle)style;
@end

NS_ASSUME_NONNULL_END
