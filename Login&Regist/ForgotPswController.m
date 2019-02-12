//
//  ForgotPswController.m
//  GrowthPlan
//
//  Created by 王政 on 2019/1/15.
//  Copyright © 2019年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "ForgotPswController.h"
#import "GPNaviController.h"
#import "GPlabelView.h"
#import "GPGradient.h"
#import "Verify.h"
@interface ForgotPswController ()
@property(nonatomic,strong)UIButton *loginBtn;
@property(nonatomic,strong)GPlabelView *phoneNum;
@property(nonatomic,strong)GPlabelView *passWord;
@property(nonatomic,strong)GPlabelView *codeNum;
@property(nonatomic,strong)UILabel *codeLabel;


@property(nonatomic,assign)NSInteger second;
@property(nonatomic,strong)NSTimer *timer;
@end

@implementation ForgotPswController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加监听(程序退到后台)
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnterBackground) name:@"applicationDidEnterBackground" object:nil];
    // 添加监听(程序回到前台)
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidBecomeActive) name:@"applicationDidBecomeActive" object:nil];
    
    [self setupUI];
}

-(void)viewWillAppear:(BOOL)animated {
    [self continueHistorySecond];
}


-(void)setupUI {
    
    GPNaviController *gpNav = (GPNaviController*)self.navigationController;
    [gpNav setbackNav:self andTitle:@""];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *logoImageView = [UIImageView new];
    
    self.phoneNum = [[GPlabelView alloc]initWithIntroduce:@"请输入手机号码" andStyle:PHONE_LABEL];
    
    self.codeNum = [[GPlabelView alloc]initWithIntroduce:@"请输入验证码" andStyle:CODE_LABEL];
    
    self.passWord= [[GPlabelView alloc]initWithIntroduce:@"请输入密码" andStyle:PASSWORLD_LABEL];
    
    self.loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];

    self.codeLabel = [UILabel new];
    
    
    [self.view addSubview:logoImageView];
    
    [self.view addSubview:self.phoneNum];
    
    [self.view addSubview:self.codeNum];
    
    [self.view addSubview:self.passWord];
    
    [self.view addSubview:self.loginBtn];
    
    [self.codeNum addSubview:self.codeLabel];
    
    [logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(30);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(80);
    }];
    
    [self.phoneNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(logoImageView.mas_bottom).offset(80);
        make.left.mas_equalTo(40);
        make.right.mas_equalTo(-40);
        make.height.mas_equalTo(50);
    }];
    
    [self.passWord mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.phoneNum.mas_bottom).offset(10);
        make.left.mas_equalTo(40);
        make.right.mas_equalTo(-40);
        make.height.mas_equalTo(50);
    }];
    
    [self.codeNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passWord.mas_bottom).offset(10);
        make.left.mas_equalTo(40);
        make.right.mas_equalTo(-40);
        make.height.mas_equalTo(50);
    }];
    
    [self.codeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(12);
        make.right.mas_equalTo(0);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(26);
    }];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.codeNum.mas_bottom).offset(40);
        make.left.mas_equalTo(40);
        make.right.mas_equalTo(-40);
        make.height.mas_equalTo(44);
    }];
    
    logoImageView.image = [UIImage imageNamed:@"logo"];
    
    [self.loginBtn setTitle:@"确定" forState:UIControlStateNormal];
    [self.loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.loginBtn.layer.cornerRadius = 6;
    self.loginBtn.clipsToBounds = YES;
    CAGradientLayer *btnLayer = [GPGradient setGradualColor:CGRectMake(0, 0, screenWidth - 80, 44) fromColor:0x356DFF toColor:0x6891FF];
    [self.loginBtn.layer addSublayer:btnLayer];
    [self.loginBtn bringSubviewToFront:self.loginBtn.titleLabel];
    
    self.codeLabel.text = @"获取";
    self.codeLabel.textColor = [UIColor whiteColor];
    self.codeLabel.textAlignment = NSTextAlignmentCenter;
    self.codeLabel.font = [UIFont systemFontOfSize:13];
    self.codeLabel.backgroundColor = [UIColor colorFromHex:0x4275FF alpha:1.0];
    self.codeLabel.layer.cornerRadius = 2;
    self.codeLabel.clipsToBounds = YES;
    self.codeLabel.userInteractionEnabled = YES;
    
    //事件
    [self.loginBtn addTarget:self action:@selector(sureAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(takeCodeAction:)];
    [self.codeLabel addGestureRecognizer:tap];
}

-(void)sureAction:(UIButton*)btn {
    
}

-(void)pswLoginAction:(UIButton*)btn {
    
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)takeCodeAction:(UITapGestureRecognizer*)tap {
    //监测手机号
    if (![Verify checkPhoneNum:self.phoneNum.GPtext]) {
        return;
    }
    if (tap.state == UIGestureRecognizerStateEnded) {
        //动画设置frame
        [UIView animateWithDuration:0.5 animations:^{
            self.codeLabel.frame = CGRectMake(screenWidth - 80 - 115, 12, 115, 26);
        }];
        
        self.codeLabel.text = [NSString stringWithFormat:@"%lis",(long)self.second];
        self.codeLabel.backgroundColor = [UIColor colorFromHex:0x9F9F9F alpha:1.0];
        self.codeLabel.userInteractionEnabled = NO;
        
        //缓存时间戳
        NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0];
        NSInteger time = [date timeIntervalSince1970];
        [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%li",(long)time] forKey:@"codeTime"];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(TheCountdownAction) userInfo:nil repeats:YES];
    }
}

-(void)TheCountdownAction {
    self.second -- ;
    self.codeLabel.text = [NSString stringWithFormat:@"%lis",(long)self.second];
    if (self.second == 0) {
        self.second = SECOND;
        [UIView animateWithDuration:0.5 animations:^{
            self.codeLabel.frame = CGRectMake(screenWidth - 80 - 60, 12, 60, 26);
        }];
        self.codeLabel.text = @"获取";
        self.codeLabel.backgroundColor = [UIColor colorFromHex:0x4275FF alpha:1.0];
        self.codeLabel.userInteractionEnabled = YES;
        
        [self.timer invalidate];
        self.timer = nil;
    }
    
    
}

-(void)dealloc {
    [self.timer invalidate];
    self.timer = nil;
    
    //移除监听
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"applicationDidEnterBackground" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"applicationDidBecomeActive" object:nil];
}


#pragma mark - 通知调用
-(void)applicationDidEnterBackground {
    [self.timer invalidate];
    self.timer = nil;
}

-(void)applicationDidBecomeActive {
    [self continueHistorySecond];
}



#pragma mark - 接着上次倒计时
-(void)continueHistorySecond {
    //从缓存拿上次获取验证码的时间戳
    NSInteger time = [[[NSUserDefaults standardUserDefaults] valueForKey:@"codeTime"] integerValue];
    
    NSInteger nowTime = [[NSDate date] timeIntervalSince1970];
    
    if (time && (nowTime - time < SECOND)) {
        self.second = SECOND - (nowTime - time);
        //修改UI，获取时间，开始倒计时
        [self.codeLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(12);
            make.right.mas_equalTo(0);
            make.width.mas_equalTo(115);
            make.height.mas_equalTo(26);
        }];
        self.codeLabel.backgroundColor = [UIColor colorFromHex:0x9F9F9F alpha:1.0];
        self.codeLabel.userInteractionEnabled = NO;
        self.codeLabel.text = [NSString stringWithFormat:@"%lis",(long)self.second];
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(TheCountdownAction) userInfo:nil repeats:YES];
        
    }else
    {
        self.second = SECOND;
    }
}


@end
