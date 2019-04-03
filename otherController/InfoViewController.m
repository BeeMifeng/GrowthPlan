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

@interface InfoViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *ownerView;
@property (weak, nonatomic) IBOutlet UIView *babyView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@property (weak, nonatomic) IBOutlet UIButton *passBtn;

@property (weak, nonatomic) IBOutlet UITextField *ownerNickName;
@property (weak, nonatomic) IBOutlet UITextField *ownerRelation;
@property (weak, nonatomic) IBOutlet UITextField *ownerBirthday;
@property (weak, nonatomic) IBOutlet UITextField *city;
@property (weak, nonatomic) IBOutlet UITextField *password;

@property (weak, nonatomic) IBOutlet UITextField *babyNickName;
@property (weak, nonatomic) IBOutlet UITextField *babySex;
@property (weak, nonatomic) IBOutlet UITextField *babyBorthday;
@property (weak, nonatomic) IBOutlet UITextField *babyGrande;
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
@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

-(void)setup {
    
    //设置属性
    
    for (UIView *btn in self.ownerView.subviews) {
        if ([btn isKindOfClass:[UITextField class]]) {
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
        if ([btn isKindOfClass:[UITextField class]]) {
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
    self.scrollView.contentSize = CGSizeMake(screenWidth, self.saveBtn.frame.origin.y + self.saveBtn.frame.size.height + 30);
    
    CAGradientLayer *btnLayer = [GPGradient setGradualChangingColor:self.saveBtn fromColor:0x356DFF toColor:0x6891FF];
    [self.saveBtn.layer addSublayer:btnLayer];
    [self.saveBtn bringSubviewToFront:self.saveBtn.titleLabel];
}

- (IBAction)saveAction:(id)sender {
    
}
- (IBAction)passAction:(id)sender {
    
    if ([self.caller isEqualToString:@"SMSLoginController"]) {
        //进入主页
        GPBarController *gCtl = [[GPBarController alloc]init];
        [self presentViewController:gCtl animated:YES completion:^{
            
        }];
    }
    
}



@end
