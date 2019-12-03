//
//  AboutController.m
//  GrowthPlan
//
//  Created by 李嘉伦 on 2019/11/29.
//  Copyright © 2019 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "AboutController.h"
#import "GPNaviController.h"
#import "UIColor+Hex.h"

@interface AboutController ()

@end

@implementation AboutController

- (void)viewDidLoad {
    [super viewDidLoad];
    GPNaviController *gpNav = (GPNaviController*)self.navigationController;
    [gpNav setbackNav:self andTitle:@"关于我们"];
    [self setup];
   
}

-(void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden = YES;
}

-(void)setup {
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake((screenWidth-80)/2, (screenHeight - navHeight-statuBarHeight)/2-200, 80, 80)];
    imgView.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor;
    imgView.layer.cornerRadius = 10;
    imgView.layer.shadowColor = [UIColor colorWithRed:212/255.0 green:212/255.0 blue:212/255.0 alpha:0.5].CGColor;
    imgView.layer.shadowOffset = CGSizeMake(0,4);
    imgView.layer.shadowOpacity = 1;
    imgView.layer.shadowRadius = 7;
    imgView.image = [UIImage imageNamed:@"logo"];
    [self.view addSubview:imgView];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, screenHeight - 200,screenWidth , 30)];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor colorFromHex:0x999999 alpha:1.0];
    label.text =  [NSString stringWithFormat:@"version %@",[[[NSBundle mainBundle] infoDictionary]objectForKey:@"CFBundleShortVersionString"]];
    [self.view addSubview:label];
}

@end
