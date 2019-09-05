//
//  InfoViewController.m
//  GrowthPlan
//
//  Created by lijialun on 2019/4/3.
//  Copyright © 2019年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "InfoViewController.h"
#import "GPBarController.h"
#import "GPGradient.h"
#import "GPUIPickView.h"
#import "Verify.h"
#import "NetWorkManager.h"
#import "MCFileManager.h"
#import "SVProgressHUD.h"

@interface InfoViewController ()<GPUIPickViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *ownerView;
@property (weak, nonatomic) IBOutlet UIView *babyView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@property (weak, nonatomic) IBOutlet UIButton *passBtn;

@property (weak, nonatomic) IBOutlet UITextField *ownerNickName;
@property (weak, nonatomic) IBOutlet UILabel *ownerRelation;
@property (weak, nonatomic) IBOutlet UILabel *ownerBirthday;
@property (weak, nonatomic) IBOutlet UILabel *ownerCity;
@property (weak, nonatomic) IBOutlet UITextField *password;

@property (weak, nonatomic) IBOutlet UITextField *babyNickName;
@property (weak, nonatomic) IBOutlet UILabel *babySex;
@property (weak, nonatomic) IBOutlet UILabel *babyBirthday;
@property (weak, nonatomic) IBOutlet UILabel *babyGrade;
@property (weak, nonatomic) IBOutlet UITextField *babyDream;

@property (weak, nonatomic) IBOutlet UIButton *oNickName;
@property (weak, nonatomic) IBOutlet UIButton *orelation;
@property (weak, nonatomic) IBOutlet UIButton *oBirthday;
@property (weak, nonatomic) IBOutlet UIButton *oCity;
@property (weak, nonatomic) IBOutlet UIButton *oPassword;

@property (weak, nonatomic) IBOutlet UILabel *bNickName;
@property (weak, nonatomic) IBOutlet UILabel *bSex;
@property (weak, nonatomic) IBOutlet UILabel *bBirthday;
@property (weak, nonatomic) IBOutlet UILabel *bGrande;
@property (weak, nonatomic) IBOutlet UILabel *bDream;


@property(nonatomic,strong)GPUIPickView *pickView;
@property(nonatomic,copy)NSString *call;

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self setupData];
}

-(void)setupData {
    
}

-(void)setup {
    
    //设置属性
    
    for (UIView *btn in self.ownerView.subviews) {
        if (![btn isKindOfClass:[UIButton class]]) {
            continue;
        }
        btn.backgroundColor = [UIColor whiteColor];
        btn.layer.cornerRadius = 15;
        btn.layer.shadowColor = [UIColor GPTextTitleColor].CGColor;
        btn.layer.shadowOffset = CGSizeMake(1, 1);//偏移距离
        btn.layer.shadowOpacity = 0.5;//不透明度
        btn.layer.shadowRadius = 2.0;//半径
    }
    
    for (UIView *btn in self.babyView.subviews) {
        if (![btn isKindOfClass:[UIButton class]]) {
            continue;
        }
        btn.backgroundColor = [UIColor whiteColor];
        btn.layer.cornerRadius = 15;
        btn.layer.shadowColor = [UIColor GPTextTitleColor].CGColor;
        btn.layer.shadowOffset = CGSizeMake(1, 1);//偏移距离
        btn.layer.shadowOpacity = 0.5;//不透明度
        btn.layer.shadowRadius = 2.0;//半径
    }
    
    self.ownerView.backgroundColor = [UIColor whiteColor];
    self.ownerView.layer.cornerRadius = 4;
    self.ownerView.layer.shadowColor = [UIColor GPTextTitleColor].CGColor;
    self.ownerView.layer.shadowOffset = CGSizeMake(1, 1);//偏移距离
    self.ownerView.layer.shadowOpacity = 0.5;//不透明度
    self.ownerView.layer.shadowRadius = 3.0;//半径
    
    self.babyView.backgroundColor = [UIColor whiteColor];
    self.babyView.layer.cornerRadius = 4;
    self.babyView.layer.shadowColor = [UIColor GPTextTitleColor].CGColor;
    self.babyView.layer.shadowOffset = CGSizeMake(1, 1);//偏移距离
    self.babyView.layer.shadowOpacity = 0.5;//不透明度
    self.babyView.layer.shadowRadius = 3.0;//半径
    
    self.saveBtn.layer.cornerRadius = 25;
    self.saveBtn.clipsToBounds = YES;
    [self.saveBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CAGradientLayer *btnLayer = [GPGradient setGradualChangingColor:self.saveBtn fromColor:0x356DFF toColor:0x6891FF];
    [self.saveBtn.layer addSublayer:btnLayer];
    [self.saveBtn bringSubviewToFront:self.saveBtn.titleLabel];
}

- (IBAction)saveAction:(id)sender {
    //校验
    if ([Verify infoForm:self.ownerNickName.text ownerRelation:self.ownerRelation.text ownerBirthday:self.ownerBirthday.text ownerCity:self.ownerCity.text passWord:self.password.text babyNickName:self.babyNickName.text babySex:self.babySex.text babyBirthday:self.babyBirthday.text babyGrade:self.babyGrade.text babyDream:self.babyDream.text]) {
        
        //参数准备
        NSDictionary *catchUserDic = [MCFileManager dictionaryInPlistFileOfPath:gp_user_info];
        
        NSString *relation = @"0";
        if ([self.ownerRelation.text isEqualToString:@"妈妈"]) {
            relation = @"1";
        }else if([self.ownerRelation.text isEqualToString:@"爷爷/外公"]){
            relation = @"2";
        }else if([self.ownerRelation.text isEqualToString:@"奶奶/外婆"]){
            relation = @"3";
        }else if([self.ownerRelation.text isEqualToString:@"其他"]){
            relation = @"4";
        }
        
        NSString *sex = @"0";
        if ([self.babySex.text isEqualToString:@"女"]) {
            sex = @"1";
        }
        
        NSString *babyGradeId = @""; //年级Id
        NSData *data = [NSData dataWithContentsOfFile:gp_province_grade_info];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        for (NSDictionary *Cdic in dic[@"class"]) {
            if ([Cdic[@"name"] isEqualToString:self.babyGrade.text]) {
                babyGradeId = Cdic[@"id"];
                break;
            }
        }
        
        //生日
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        NSDate *userDate = [formatter dateFromString:self.ownerBirthday.text];
        NSDate *babyDate = [formatter dateFromString:self.babyBirthday.text];
        [formatter setDateFormat:@"yyyyMMdd"];
        NSString *userBirthday = [formatter stringFromDate:userDate];
        NSString *babyBirthday = [formatter stringFromDate:babyDate];
        
        NSDictionary *userDic = @{
                                  @"id":catchUserDic[@"user"][@"id"],
                                  @"password":self.password.text,
                                  @"nickname":self.ownerNickName.text,
                                  @"province":[[self.ownerCity.text mutableCopy] componentsSeparatedByString:@"-"].firstObject,
                                  @"city":[[self.ownerCity.text mutableCopy] componentsSeparatedByString:@"-"].lastObject,
                                  @"relation":relation,
                                  @"birthday":userBirthday
                                  };
        
        NSDictionary *babyDic = @{
                                  @"nickname":self.babyNickName.text,
                                  @"sex":sex,
                                  @"birthday":babyBirthday,
                                  @"classId":babyGradeId,
                                  @"profession":self.babyDream.text
                                  };
        
        NSDictionary *paramsDic = @{
                                    @"user":userDic,
                                    @"baby":babyDic
                                    };
        
        [[NetWorkManager shareNetWorkManager]requestDataWithUrl:[NSString stringWithFormat:@"%@%@",gp_address_app,gp_upload_info] andMethod:PUT andParams:paramsDic andSuccessCallBack:^(id  _Nonnull responseObject) {
            
            if ([[responseObject[@"code"]  stringValue] isEqualToString:@"0"]) {
                [SVProgressHUD showSuccessWithStatus:@"保存成功"];
                [SVProgressHUD dismissWithDelay:2.0];
                //登录成功,写入缓存
                [MCFileManager saveDictionary:responseObject[@"data"] isPlistFileOfPath:gp_user_info];
                //进入主页
                GPBarController *gCtl = [[GPBarController alloc]init];
                [self presentViewController:gCtl animated:YES completion:^{
                    
                }];
            }else
            {
                [SVProgressHUD showSuccessWithStatus:responseObject[@"msg"]];
                [SVProgressHUD dismissWithDelay:2.0];
            }
            
        } andFailCallBack:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            
        }];
    }
    
}
- (IBAction)passAction:(id)sender {
    
    if ([self.caller isEqualToString:@"SMSLoginController"]) {
        //进入主页
        GPBarController *gCtl = [[GPBarController alloc]init];
        [self presentViewController:gCtl animated:YES completion:^{
            
        }];
    }
    
}

- (IBAction)ownerTapAction:(id)sender {
    self.pickView =  [[GPUIPickView alloc]initWithPickType:BirthDay];
    self.pickView.delegate = self;
    self.call = @"ownerBirthDay";
}

- (IBAction)ownerRelationAction:(id)sender {
    self.pickView =  [[GPUIPickView alloc]initWithdataArr:@[@"爸爸",@"妈妈",@"爷爷/外公",@"奶奶/外婆",@"其他"]];
    self.pickView.delegate = self;
    self.call = @"ownerRelation";
}

- (IBAction)ownerCityAction:(id)sender {
    self.pickView =  [[GPUIPickView alloc]initWithPickType:Provice];
    self.pickView.delegate = self;
    self.call = @"ownerCity";
}

- (IBAction)babySexAction:(id)sender {
    self.pickView =  [[GPUIPickView alloc]initWithdataArr:@[@"男",@"女"]];
    self.pickView.delegate = self;
    self.call = @"babySex";
}

- (IBAction)babyBirthdayAction:(id)sender {
    self.pickView =  [[GPUIPickView alloc]initWithPickType:BirthDay];
    self.pickView.delegate = self;
    self.call = @"babyBirthDay";
}
- (IBAction)babyGradeAction:(id)sender {
    NSData *data = [NSData dataWithContentsOfFile:gp_province_grade_info];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSMutableArray *tempArr = [NSMutableArray new];
    for (NSDictionary *Cdic in dic[@"class"]) {
        [tempArr addObject:Cdic[@"name"]];
    }
    self.pickView =  [[GPUIPickView alloc]initWithdataArr:tempArr];
    self.pickView.delegate = self;
    self.call = @"babyGrade";
}





-(void)didClickSure:(NSString *)string {
    if ([self.call isEqualToString:@"ownerBirthDay"]) {
        self.ownerBirthday.text = string;
    }else if ([self.call isEqualToString:@"ownerRelation"]){
        self.ownerRelation.text = string;
    }else if ([self.call isEqualToString:@"ownerCity"]){
        self.ownerCity.text = string;
    }else if ([self.call isEqualToString:@"babySex"]){
        self.babySex.text = string;
    }
    else if ([self.call isEqualToString:@"babyBirthDay"]){
        self.babyBirthday.text = string;
    }
    else if ([self.call isEqualToString:@"babyGrade"]){
        self.babyGrade.text = string;
    }
}
@end
