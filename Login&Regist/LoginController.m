//
//  LoginController.m
//  GrowthPlan
//
//  Created by 王政 on 2019/1/14.
//  Copyright © 2019年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "LoginController.h"
#import "GPlabelView.h"
#import "GPGradient.h"
#import "SMSLoginController.h"
#import "ForgotPswController.h"
#import "Verify.h"
#import "NetWorkManager.h"
#import "SVProgressHUD.h"
#import "GrowthPlanCatch.h"
#import "GPBarController.h"
#import "MCFileManager.h"
@interface LoginController ()
@property(nonatomic,strong)UIButton *loginBtn;
@property(nonatomic,strong)GPlabelView *phoneNum;
@property(nonatomic,strong)GPlabelView *passWord;
@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
    [GrowthPlanCatch loadProvinceAndGrade:^(id  _Nonnull responseObject) {
        
    } fail:^(NSError * _Nonnull error) {
        
    }];
}

-(void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(void)setupUI {
    
    UIImageView *logoImageView = [UIImageView new];
    
    self.phoneNum = [[GPlabelView alloc]initWithIntroduce:@"请输入手机号码" andStyle:PHONE_LABEL];
    
    self.passWord= [[GPlabelView alloc]initWithIntroduce:@"请输入密码" andStyle:PASSWORLD_LABEL];
    
    self.loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIButton *smsLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIButton *forgotPsw = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.view addSubview:logoImageView];
    
    [self.view addSubview:self.phoneNum];
    
    [self.view addSubview:self.passWord];
    
    [self.view addSubview:self.loginBtn];
    
    [self.view addSubview:smsLogin];
    
    [self.view addSubview:forgotPsw];
    
    [logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
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
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passWord.mas_bottom).offset(40);
        make.left.mas_equalTo(40);
        make.right.mas_equalTo(-40);
        make.height.mas_equalTo(44);
    }];
    
    [smsLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.loginBtn.mas_bottom).offset(20);
        make.left.mas_equalTo(40);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(20);
    }];
    
    [forgotPsw mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.loginBtn.mas_bottom).offset(20);
        make.right.mas_equalTo(-40);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(20);
    }];

    
    
    logoImageView.image = [UIImage imageNamed:@"logo"];
    
    
    [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.loginBtn.layer.cornerRadius = 6;
    self.loginBtn.clipsToBounds = YES;
    CAGradientLayer *btnLayer = [GPGradient setGradualColor:CGRectMake(0, 0, screenWidth - 80, 44) fromColor:0x356DFF toColor:0x6891FF];
    [self.loginBtn.layer addSublayer:btnLayer];
    [self.loginBtn bringSubviewToFront:self.loginBtn.titleLabel];
    
    
    [smsLogin setTitle:@"短信登录" forState:UIControlStateNormal];
    [smsLogin setTitleColor:[UIColor colorFromHex:0x5A87FF alpha:1.0] forState:UIControlStateNormal];
    smsLogin.titleLabel.font = [UIFont systemFontOfSize:13];
    [forgotPsw setTitle:@"忘记密码" forState:UIControlStateNormal];
    [forgotPsw setTitleColor:[UIColor colorFromHex:0x5A87FF alpha:1.0] forState:UIControlStateNormal];
    forgotPsw.titleLabel.font = [UIFont systemFontOfSize:13];
    
    //事件
    [self.loginBtn addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [smsLogin addTarget:self action:@selector(smsLoginAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [forgotPsw addTarget:self action:@selector(forgotPswAction:) forControlEvents:UIControlEventTouchUpInside];
}



-(void)loginAction:(UIButton*)btn {
    if ( [Verify checkPhoneNum:self.phoneNum.GPtext] && [Verify checkPassword:self.passWord.GPtext]) {
        [[NetWorkManager shareNetWorkManager]requestDataWithUrl:[NSString stringWithFormat:@"%@%@",gp_address_app,gp_psw_login] andMethod:POST andParams:@{@"mobile":self.phoneNum.GPtext,@"password":self.passWord.GPtext} andSuccessCallBack:^(id _Nonnull responseObject) {
            
            if ([[responseObject[@"code"]  stringValue] isEqualToString:@"0"]) {
                //登录成功,写入缓存
                [MCFileManager saveDictionary:responseObject[@"data"] isPlistFileOfPath:gp_user_info];
                GPBarController *gCtl = [[GPBarController alloc]init];
                gCtl.modalPresentationStyle = UIModalPresentationFullScreen;
                [self presentViewController:gCtl animated:YES completion:^{
                    
                }];
            }else
            {
                [SVProgressHUD showInfoWithStatus:[NSString stringWithFormat:@"%@ %@",responseObject[@"msg"],@"请先注册"]];
                [SVProgressHUD dismissWithDelay:2.0];
                //跳到验证码登录页面
                SMSLoginController *smsCtl = [SMSLoginController new];
                [self.navigationController pushViewController:smsCtl animated:YES];
            }
            
        } andFailCallBack:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            
        }];
    }
}


-(void)smsLoginAction:(UIButton*)btn {
    SMSLoginController *smsCtl = [SMSLoginController new];
    [self.navigationController pushViewController:smsCtl animated:YES];
}

-(void)forgotPswAction:(UIButton*)btn {
    ForgotPswController *forCtl = [ForgotPswController new];
    [self.navigationController pushViewController:forCtl animated:YES];
}

@end
