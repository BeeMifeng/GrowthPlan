//
//  GPlabelView.m
//  GrowthPlan
//
//  Created by 王政 on 2019/1/14.
//  Copyright © 2019年 lijialun.develop.GrowthPlan. All rights reserved.
//




#import "GPlabelView.h"

@interface GPlabelView()<UITextFieldDelegate>
@property(nonatomic,strong)UILabel *label;
@property(nonatomic,strong)UITextField *textFile;
@end

@implementation GPlabelView

-(instancetype)initWithIntroduce:(NSString*)intro andStyle:(labelStyle)style {
    self = [super init];
    if (self) {
        [self setupUIAndIntroduce:intro AndStyle:style];
    }
    return self;
}


-(void)setupUIAndIntroduce:(NSString*)intro  AndStyle:(labelStyle)style {
    
    self.label = [[UILabel alloc]init];
    self.textFile = [[UITextField alloc]init];
    
    UIView *view = [[UIView alloc]init];
    
    [self addSubview:self.label];
    [self addSubview:self.textFile];
    [self addSubview:view];
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(20);
    }];
    
    [self.textFile mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.label.mas_bottom).offset(0);
        make.height.mas_equalTo(25);
    }];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.mas_bottom).offset(-1);
        make.height.mas_equalTo(1);
    }];
    
    self.label.text = intro;
    self.label.textColor = [UIColor GPTextTheTimeColor];
    self.label.font = [UIFont systemFontOfSize:13];
    
    self.textFile.textColor = [UIColor GPblack];
    self.textFile.font = [UIFont systemFontOfSize:15 weight:200];
    self.textFile.delegate = self;
    
    view.backgroundColor = [UIColor colorFromHex:0xd8d8d8 alpha:1.0];
    
    [self.textFile addTarget:self action:@selector(textFieldDidChanging:) forControlEvents:UIControlEventEditingChanged];

}

- (void) textFieldDidChanging:(id) sender {
    UITextField *_field = (UITextField *)sender;
    self.GPtext = _field.text;
}

@end
