//
//  MoreProController.m
//  GrowthPlan
//
//  Created by lijialun on 2019/4/11.
//  Copyright © 2019年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "MoreProController.h"
#import "GPNaviController.h"

@interface MoreProController ()

@end

@implementation MoreProController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:YES animated:true];
    self.tabBarController.tabBar.hidden = YES;
    GPNaviController *gpNav = (GPNaviController*)self.navigationController;
    [gpNav setbackNav:self andTitle:@"返回"];
}

@end
