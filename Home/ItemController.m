//
//  ItemController.m
//  GrowthPlan
//
//  Created by 王政 on 2019/1/11.
//  Copyright © 2019年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "ItemController.h"
#import "GPNaviController.h"

@interface ItemController ()

@end

@implementation ItemController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    GPNaviController *gpNav = (GPNaviController*)self.navigationController;
    
    [gpNav setbackNav:self andTitle:self.navTitle];
}

@end
