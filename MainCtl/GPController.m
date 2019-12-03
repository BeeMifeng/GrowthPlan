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

static UIView *_statusBar = nil;

-(UIView*)getStatusBar {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      if (@available(iOS 13.0, *)) {
           _statusBar = [[UIView alloc]initWithFrame:[UIApplication sharedApplication].keyWindow.windowScene.statusBarManager.statusBarFrame];
          [[UIApplication sharedApplication].keyWindow addSubview:_statusBar];
       } else {
           // Fallback on earlier versions
          _statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
       }
    });
    return _statusBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.modalPresentationStyle = UIModalPresentationFullScreen;
    self.view.backgroundColor = [UIColor whiteColor];
    if ([[self getStatusBar] respondsToSelector:@selector(setBackgroundColor:)]) {
        [self getStatusBar].backgroundColor = [UIColor whiteColor];
    }
}

//字体颜色只有黑白两种
-(void)setStatueBackColor:(UIColor*)bColor andTextColor:(UIStatusBarStyle)statue {
    [self getStatusBar].backgroundColor = bColor;
}

@end
