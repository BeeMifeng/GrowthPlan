//
//  InfoController.m
//  GrowthPlan
//
//  Created by 李嘉伦 on 2019/12/4.
//  Copyright © 2019 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "InfoController.h"
#import "UIColor+Hex.h"

@interface InfoController ()
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIButton *passBtn;
@property(nonatomic,strong)UIImageView *heardImg;
@end

@implementation InfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

-(void)setup {
    self.tabBarController.tabBar.hidden = YES;
    
    self.scrollView = [UIScrollView new];
    self.passBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.heardImg = [UIImageView new];
    UILabel *lable = [UILabel new];
    UILabel *you = [UILabel new];
    UIView *youView = [UIView new];
    UILabel *youBaby = [UILabel new];
    UIView *youbBabyView = [UIView new];
    UILabel *youNameKey = [UILabel new];
    UILabel *youIdKey = [UILabel new];
    UILabel *youBorthDayKey = [UILabel new];
    UILabel *youCityKey = [UILabel new];
    
    
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.passBtn];
    [self.scrollView addSubview:self.heardImg];
    [self.scrollView addSubview:lable];
    [self.scrollView addSubview:you];
    [self.scrollView addSubview:youBaby];
    [self.scrollView addSubview:youView];
    [self.scrollView addSubview:youbBabyView];
    [youView addSubview:youNameKey];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    
    [self.passBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(20);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(30);
    }];
    
    [self.heardImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passBtn.mas_bottom).offset(20);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(80);
    }];
    
    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.heardImg.mas_bottom).offset(3);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(20);
    }];
    
    [you mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lable.mas_bottom).offset(10);
        make.left.mas_equalTo(30);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];
    
    [youView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(you.mas_bottom).offset(5);
        make.left.mas_equalTo(5);
        make.right.mas_equalTo(self.scrollView.mas_right).offset(screenWidth-10);
        make.height.mas_equalTo(200);
    }];
    
    [youBaby mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(youView.mas_bottom).offset(10);
        make.left.mas_equalTo(30);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];

    [youbBabyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(youBaby.mas_bottom).offset(5);
        make.left.mas_equalTo(5);
        make.right.mas_equalTo(self.scrollView.mas_right).offset(screenWidth-10);
        make.height.mas_equalTo(200);
    }];
    
    [youNameKey mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(5);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(30);
    }];
    
    [self.passBtn setTitle:@"暂不填写" forState:UIControlStateNormal];
    [self.heardImg setImage:[UIImage imageNamed:@"heard"]];
    lable.text = @"点击头像编辑";
    lable.textColor = [UIColor colorFromHex:0x666666 alpha:1.0];
    lable.font = [UIFont systemFontOfSize:12];
    
    you.text = @"您的信息";
    you.textColor = [UIColor colorFromHex:0x333333 alpha:1.0];
    you.font = [UIFont systemFontOfSize:17];
    
    youView.layer.backgroundColor = [UIColor colorFromHex:0xffffff alpha:1.0].CGColor;
    youView.layer.cornerRadius = 4;
    youView.layer.shadowColor = [UIColor colorFromHex:0xdfdfdf alpha:1.0].CGColor;
    youView.layer.shadowOffset = CGSizeMake(0,1);
    youView.layer.shadowOpacity = 1;
    youView.layer.shadowRadius = 2;

    
    youBaby.text = @"宝贝信息";
    youBaby.textColor = [UIColor colorFromHex:0x333333 alpha:1.0];
    youBaby.font = [UIFont systemFontOfSize:17];
    
    youbBabyView.layer.backgroundColor = [UIColor colorFromHex:0xffffff alpha:1.0].CGColor;
    youbBabyView.layer.cornerRadius = 4;
    youbBabyView.layer.shadowColor = [UIColor colorFromHex:0xdfdfdf alpha:1.0].CGColor;
    youbBabyView.layer.shadowOffset = CGSizeMake(0,1);
    youbBabyView.layer.shadowOpacity = 1;
    youbBabyView.layer.shadowRadius = 2;
    

    youNameKey.layer.backgroundColor = [UIColor colorFromHex:0xffffff alpha:1.0].CGColor;
    youNameKey.layer.cornerRadius = 15;
    youNameKey.layer.shadowColor = [UIColor colorFromHex:0xdfdfdf alpha:1.0].CGColor;
    youNameKey.layer.shadowOffset = CGSizeMake(0,1);
    youNameKey.layer.shadowOpacity = 1;
    youNameKey.layer.shadowRadius = 2;
    youNameKey.text = @"昵称";
    youNameKey.textAlignment = NSTextAlignmentCenter;
}


@end
