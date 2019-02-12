//
//  MineViewItem.m
//  GrowthPlan
//
//  Created by 王政 on 2019/1/2.
//  Copyright © 2019年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "MineViewItem.h"
@interface MineViewItem()
@property(nonatomic,strong)UIImageView *leftImg;
@property(nonatomic,strong)UIImageView *rightImg;
@property(nonatomic,strong)UILabel *keyLabel;
@property(nonatomic,strong)UILabel *valueLabel;
@end
@implementation MineViewItem


-(instancetype)init {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, screenWidth, 50);
        [self setup];
    }
    return self;
}

-(void)setup {
    
    self.leftImg = [UIImageView new];
    self.keyLabel = [UILabel new];
    self.valueLabel = [UILabel new];
    self.rightImg = [UIImageView new];
    
    [self addSubview:self.leftImg];
    [self addSubview:self.keyLabel];
    [self addSubview:self.valueLabel];
    [self addSubview:self.rightImg];
    
    //布局
    [self.leftImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.left.mas_equalTo(24);
        make.width.mas_equalTo(38);
        make.height.mas_equalTo(38);
    }];
    
    [self.keyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.left.mas_equalTo(self.leftImg.mas_right).offset(13);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(20);
    }];
    
    [self.valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.left.mas_equalTo(self.keyLabel.mas_right).offset(22);
        make.right.mas_equalTo(self.rightImg.mas_left).offset(10);
        make.height.mas_equalTo(21);
    }];
    
    
    [self.rightImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.right.mas_equalTo(-24);
        make.width.mas_equalTo(16);
        make.height.mas_equalTo(16);
    }];
    
    //设置属性
    self.keyLabel.font = [UIFont systemFontOfSize:14];
    self.keyLabel.textColor = [UIColor GPblack];
    
    self.valueLabel.font = [UIFont systemFontOfSize:15 weight:200];
    self.valueLabel.textColor = [UIColor GPblack];
}

-(void)setLeftImg:(NSString *)leftImgName andRightImg:(NSString*)rightImgName andKey:(NSString*)key andValue:(NSString*)value {
    
    self.leftImg.image = [UIImage imageNamed:leftImgName];
    self.rightImg.image = [UIImage imageNamed:rightImgName];
    self.keyLabel.text = key;
    self.valueLabel.text = value;
}


@end
