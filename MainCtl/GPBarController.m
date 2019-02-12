//
//  GPBarController.m
//  GrowthPlan
//
//  Created by 王政 on 2018/12/26.
//  Copyright © 2018年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "GPBarController.h"
#import "GPNaviController.h"
#import "HomeController.h"
#import "LearningController.h"
#import "PlanController.h"
#import "MineController.h"
#import "UIColor+Hex.h"
@interface GPBarController ()

@end

@implementation GPBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
}


-(void)setUp {
    
    self.tabBar.tintColor = [UIColor GPBarTitleColor];
  
    GPNaviController *homeNav = [[GPNaviController alloc]initWithRootViewController:[HomeController new]];
    GPNaviController *learningNav = [[GPNaviController alloc]initWithRootViewController:[LearningController new]];
    GPNaviController *planNav = [[GPNaviController alloc]initWithRootViewController:[PlanController new]];
    GPNaviController *mineNav = [[GPNaviController alloc]initWithRootViewController:[MineController new]];
 
    [self addChildViewController:homeNav andImageName:@"home" andSlectedImageName:@"home_selected" andTitile:@"首页"];
    [self addChildViewController:learningNav andImageName:@"learn" andSlectedImageName:@"learn_selected" andTitile:@"学习"];
    [self addChildViewController:planNav andImageName:@"plan" andSlectedImageName:@"plan_selected" andTitile:@"计划"];
    [self addChildViewController:mineNav andImageName:@"mine" andSlectedImageName:@"mine_selected" andTitile:@"我的"];
}

-(void)addChildViewController:(UIViewController *)childController andImageName:(NSString*)imageName andSlectedImageName:(NSString*)SelectName andTitile:(NSString*)title {
    
    childController.tabBarItem.title = title;
    UIImage *imageNormal = [UIImage imageNamed:imageName];
    imageNormal = [imageNormal imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.tabBarItem.image = imageNormal;
    
    
    UIImage *imageSelected = [UIImage imageNamed:SelectName];
    imageSelected = [imageSelected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.tabBarItem.selectedImage = imageSelected;
    
    [self addChildViewController:childController];
}
@end
