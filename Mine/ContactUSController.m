//
//  ContactUSController.m
//  GrowthPlan
//
//  Created by 李嘉伦 on 2019/11/29.
//  Copyright © 2019 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "ContactUSController.h"
#import "GPNaviController.h"
#import "UIColor+Hex.h"

@interface ContactUSController ()

@end

@implementation ContactUSController

- (void)viewDidLoad {
    [super viewDidLoad];
    GPNaviController *gpNav = (GPNaviController*)self.navigationController;
    [gpNav setbackNav:self andTitle:@"联系我们"];
    [self setup];
}

-(void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden = YES;
}

-(void)setup {
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(20,20,screenWidth-40,120);
    view.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor;
    view.layer.cornerRadius = 8;
    view.layer.shadowColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:0.5].CGColor;
    view.layer.shadowOffset = CGSizeMake(0,3);
    view.layer.shadowOpacity = 1;
    view.layer.shadowRadius = 8;
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, screenWidth-80, 30)];
    label.text = @"客服微信";
    label.font = [UIFont systemFontOfSize:18];
    UILabel *labelContect = [[UILabel alloc]initWithFrame:CGRectMake(20, 60, screenWidth-80, 30)];
    labelContect.text = @"kuang123456789元";
    labelContect.textColor = [UIColor colorFromHex:0x666666 alpha:1.0];
    labelContect.font = [UIFont systemFontOfSize:16];
    
    [view addSubview:label];
    [view addSubview:labelContect];
    
    
    UIView *view1 = [[UIView alloc] init];
    view1.frame = CGRectMake(20,160,screenWidth-40,120);
    view1.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor;
    view1.layer.cornerRadius = 8;
    view1.layer.shadowColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:0.5].CGColor;
    view1.layer.shadowOffset = CGSizeMake(0,3);
    view1.layer.shadowOpacity = 1;
    view1.layer.shadowRadius = 8;
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, screenWidth-80, 30)];
    label1.text = @"微信公众号";
    label1.font = [UIFont systemFontOfSize:18];
    UILabel *labelContect1 = [[UILabel alloc]initWithFrame:CGRectMake(20, 60, screenWidth-80, 30)];
    labelContect1.text = @"匡（ID：kuang123456789)";
    labelContect1.textColor = [UIColor colorFromHex:0x666666 alpha:1.0];
    labelContect1.font = [UIFont systemFontOfSize:16];
    
    [view1 addSubview:label1];
    [view1 addSubview:labelContect1];
    
    
    [self.view addSubview:view];
    [self.view addSubview:view1];
}

@end
