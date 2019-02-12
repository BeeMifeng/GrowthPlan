//
//  GPNaviController.m
//  GrowthPlan
//
//  Created by 王政 on 2018/12/26.
//  Copyright © 2018年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "GPNaviController.h"

@interface GPNaviController ()

@end

@implementation GPNaviController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     self.navigationBarHidden = YES;
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
}



-(void)setHiddleNav {
    
    
}


-(void)setClearNav {
    
    
}


-(void)setbackNav:(UIViewController*)viewController andTitle:(NSString*)title{
    
    viewController.navigationController.navigationBarHidden = NO;
    viewController.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    viewController.navigationController.navigationBar.translucent = NO;

    UIView *leftBtnView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.navigationBar.frame.size.height + 100, self.navigationBar.frame.size.height)];
    UIImageView *btn = [[UIImageView alloc] init];
    btn.frame = CGRectMake(-8, (self.navigationBar.frame.size.height - 16)/2, 16, 16);
    btn.image =  [UIImage imageNamed:@"come_back"];
    [leftBtnView addSubview:btn];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:leftBtnView];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(16, 0, 100, self.navigationBar.frame.size.height)];
    label.text = title;
    [leftBtnView addSubview:label];
    viewController.navigationItem.leftBarButtonItem = item;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(comeBack)];
    [leftBtnView addGestureRecognizer:tap];
}


-(void)comeBack {
    [self popViewControllerAnimated:YES];  
}
@end
