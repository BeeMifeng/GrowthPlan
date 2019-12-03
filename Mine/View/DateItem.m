//
//  DateItem.m
//  GrowthPlan
//
//  Created by 王政 on 2019/1/3.
//  Copyright © 2019年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "DateItem.h"

@interface DateItem()
@property(nonatomic,strong)UILabel *mouth;
@property(nonatomic,strong)UILabel *day;

@property(nonatomic,assign)BOOL isSignin;
@end

@implementation DateItem

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.mouth = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, frame.size.width, (frame.size.height - 20)/2)];
        self.day = [[UILabel alloc]initWithFrame:CGRectMake(0, 10 + (frame.size.height - 20)/2, frame.size.width, (frame.size.height - 20)/2)];
        
        self.mouth.textColor = [UIColor colorFromHex:0xffffff alpha:1.0];
        self.mouth.font = [UIFont systemFontOfSize:10];
        self.mouth.textAlignment = NSTextAlignmentCenter;
        self.mouth.text = @"Doc";
        
        self.day.textColor = [UIColor colorFromHex:0xffffff alpha:1.0];
        self.day.font = [UIFont systemFontOfSize:15];
        self.day.textAlignment = NSTextAlignmentCenter;
        self.day.text = @"11";
        
        self.isSignin = NO;
        
        [self addSubview:self.mouth];
        [self addSubview:self.day];
    }
    return self;
}

-(void)refreshUIWithSignMode:(SginModel*)model {
    if ([model.signFlag  isEqual: @"1"]) {
        self.backgroundColor = [UIColor colorFromHex:0x4578FF alpha:1.0];
    }else
    {
        self.backgroundColor = [UIColor colorFromHex:0xC4D4FF alpha:1.0];
    }
    self.mouth.text = model.month;
    self.day.text = model.day;
}

@end
