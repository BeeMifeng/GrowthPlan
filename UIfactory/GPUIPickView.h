//
//  GPUIPickView.h
//  GrowthPlan
//
//  Created by lijialun on 2019/4/4.
//  Copyright © 2019年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    BirthDay = 0,
    Provice,
    OtherPickType
} PickType;

@protocol GPUIPickViewDelegate<NSObject>
-(void)didClickSure:(NSString*)string;
@end

@interface GPUIPickView : UIView

@property(nonatomic,weak)id <GPUIPickViewDelegate>delegate;

-(instancetype)initWithPickType:(PickType)type;
//不可联动
-(instancetype)initWithdataArr:(NSArray*)dataArr;
@end

NS_ASSUME_NONNULL_END
