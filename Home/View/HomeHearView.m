//
//  HomeHearView.m
//  GrowthPlan
//
//  Created by 王政 on 2018/12/27.
//  Copyright © 2018年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "HomeHearView.h"
#import "GPSearchView.h"
#import "ItemView.h"
#import "Masonry.h"

@interface HomeHearView()
@property(nonatomic,strong)GPSearchView *gpSearchView;
@property(nonatomic,strong)ItemView *customerServer;
@end

@implementation HomeHearView
- (instancetype)init
{
    self = [super init];
    if (self) {
        _gpSearchView = [[GPSearchView alloc]init];
        _customerServer = [[ItemView alloc]initWithImageName:@"customer_service" andTitle:@"客服"];
        [self addSubview:_gpSearchView];
        [self addSubview:_customerServer];
        [self GPlayout];
    }
    return self;
}

-(void)GPlayout {
   
    [self.customerServer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(16);
        make.right.mas_equalTo(-25);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(38);
    }];
    
    [self.gpSearchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(25);
        make.top.mas_equalTo(16);
    make.right.mas_equalTo(self.customerServer.mas_left).offset(-20);
        make.height.mas_equalTo(36);
    }];
    
    self.backgroundColor = [UIColor whiteColor];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(conectUsAction:)];
    [self.customerServer addGestureRecognizer:tap];
}


-(void)conectUsAction:(UITapGestureRecognizer*)tap {
    if (_delegate && [_delegate respondsToSelector:@selector(didSelectedContectUs:)]) {
        [_delegate didSelectedContectUs:tap.view];
    }
}

@end
