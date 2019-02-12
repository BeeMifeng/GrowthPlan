//
//  GPController.m
//  GrowthPlan
//
//  Created by 王政 on 2018/12/26.
//  Copyright © 2018年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "GPController.h"

@interface GPController ()

@end

@implementation GPController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = [UIColor whiteColor];     
    }
}

//字体颜色只有黑白两种
-(void)setStatueBackColor:(UIColor*)bColor andTextColor:(UIStatusBarStyle)statue {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = bColor;
        [UIApplication sharedApplication].statusBarStyle = statue;
    }
    
}

@end
