//
//  PlanHeardCell.m
//  GrowthPlan
//
//  Created by 王政 on 2018/12/29.
//  Copyright © 2018年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "PlanHeardCell.h"
#import "TableItemView.h"
@interface PlanHeardCell()
@property(nonatomic,strong)UILabel *dream;
@property(nonatomic,strong)UILabel *personData;

@end


@implementation PlanHeardCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ( self) {
        [self setup];
    }
    return  self;
}


-(void)setup {
    UIView *wrapper = [[UIView alloc]init];
    [self addSubview:wrapper];
    
    TableItemView *view1 = [[TableItemView alloc] init];
    TableItemView *view2 = [[TableItemView alloc] init];
    TableItemView *view3 = [[TableItemView alloc] init];
    [wrapper addSubview:view1];
    [wrapper addSubview:view2];
    [wrapper addSubview:view3];
    
    
    [wrapper mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.right.mas_equalTo(-20);
        make.left.mas_equalTo(20);
        make.bottom.mas_equalTo(-30);
    }];
    
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.right.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(50);
    }];
    
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view1.mas_bottom).offset(10);
        make.right.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(50);
    }];
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view2.mas_bottom).offset(10);
        make.right.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(50);
    }];
    
    [view1 setLeftImg:@"dream" andRightImg:@"change" andKey:@"宝贝梦想" andValue:@"公务员"];
    [view2 setLeftImg:@"info" andRightImg:@"" andKey:@"宝贝信息" andValue:@"女生 20岁 大一"];
    [view3 setLeftImg:@"date" andRightImg:@"" andKey:@"日程计划" andValue:@"公务员"];
    
    wrapper.backgroundColor = [UIColor whiteColor];
    wrapper.layer.cornerRadius = 17;//圆角
    wrapper.layer.shadowColor = [UIColor GPTextTitleColor].CGColor;
    wrapper.layer.shadowOffset = CGSizeMake(1, 1);//偏移距离
    wrapper.layer.shadowOpacity = 0.5;//不透明度
    wrapper.layer.shadowRadius = 3.0;//半径
}

@end
