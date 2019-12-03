//
//  MoreProController.m
//  GrowthPlan
//
//  Created by lijialun on 2019/4/11.
//  Copyright © 2019年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "MoreProController.h"
#import "GPNaviController.h"
#import "NetWorkManager.h"
#import "MCFileManager.h"
#import "ProjectModel.h"
#import "ProjectAllModel.h"
#import "GPGradient.h"

@interface MoreProController ()
@property(nonatomic,strong)NSMutableArray<ProjectAllModel*> *existArr;
@property(nonatomic,strong)NSMutableArray<ProjectAllModel*> *defaultArr;
@property(nonatomic,strong)NSMutableArray<ProjectAllModel*> *allArr;

@property(nonatomic,strong)UIButton *wrapper;
@end

@implementation MoreProController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //初始化
    _existArr = [NSMutableArray new];
    _defaultArr = [NSMutableArray new];
    _allArr = [NSMutableArray new];
    
    [self.navigationController setNavigationBarHidden:YES animated:true];
    self.tabBarController.tabBar.hidden = YES;
    GPNaviController *gpNav = (GPNaviController*)self.navigationController;
    [gpNav setbackNav:self andTitle:@"返回"];
    
    
    
    //保存
    self.wrapper = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.wrapper setFrame:CGRectMake(20, screenHeight - 200, screenWidth - 40, 41)];
    [self.view addSubview:self.wrapper];
    CAGradientLayer *graderLayer =  [GPGradient setGradualChangingColor:self.wrapper fromColor:0x356DFF toColor:0x6891FF];
    [self.wrapper.layer addSublayer:graderLayer];
    self.wrapper.layer.cornerRadius = 20.5;
    self.wrapper.clipsToBounds = YES;
    [self.wrapper setTitle:@"保存" forState:UIControlStateNormal];
    [self.wrapper setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    //点击事件
    [self.wrapper addTarget:self action:@selector(saveAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self setupData];
   
}

#pragma mark *****   data
-(void)setupData {
    //学科数据
    NSDictionary *userCatchDic = [MCFileManager dictionaryInPlistFileOfPath:gp_user_info];
    [[NetWorkManager shareNetWorkManager]requestDataWithUrl:[NSString stringWithFormat:@"%@%@/%@",gp_address_app,gp_project_all,userCatchDic[@"baby"][@"id"]] andMethod:GET andParams:@{@"":@""} andSuccessCallBack:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] isEqualToString:@"0"]) {
            for (NSDictionary *dic in responseObject[@"data"][@"exist"]) {
                ProjectAllModel *model = [ProjectAllModel yy_modelWithDictionary:dic];
                [self.existArr addObject:model];
                [self.allArr addObject:model];
            }
            for (NSDictionary *dic in responseObject[@"data"][@"default"]) {
                ProjectAllModel *model = [ProjectAllModel yy_modelWithDictionary:dic];
                [self.defaultArr addObject:model];
                 [self.allArr addObject:model];
            }
        
        }
        [self setupUI];
    } andFailCallBack:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
    }];
}


-(void)setupUI {
    
    for (NSInteger i = 0; i < self.allArr.count; i++) {
       
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setFrame:CGRectMake(50 + 80 * (i%3) + (screenWidth - 340)/2* (i%3), (i/3) * 100 + 80, 80, 30)];
        [btn setTitle:self.allArr[i].projectName forState:UIControlStateNormal];
        [self.view addSubview:btn];
        
        btn.layer.cornerRadius = 15;
        btn.layer.borderWidth = 0.5;
        btn.layer.borderColor = [UIColor whiteColor].CGColor;
        btn.layer.shadowColor = [UIColor GPTextTitleColor].CGColor;
        btn.layer.shadowOffset = CGSizeMake(1, 1);//偏移距离
        btn.layer.shadowOpacity = 0.5;//不透明度
        btn.layer.shadowRadius = 3.0;//半径
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor whiteColor];
        [btn setTag:i + 10];
        [btn addTarget:self action:@selector(didChecked:) forControlEvents:UIControlEventTouchUpInside];
        
        if ([self.existArr containsObject:self.allArr[i]]) {
            btn.backgroundColor = [UIColor colorFromHex:0x658FFF alpha:1.0];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
    }
}


-(void)didChecked:(UIButton*)btn {
    
    if(btn.backgroundColor == [UIColor whiteColor]) {
         btn.backgroundColor = [UIColor colorFromHex:0x658FFF alpha:1.0];
         [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }else
    {
        btn.backgroundColor = [UIColor whiteColor];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    
    
    //数据源更换
    if ([self.existArr containsObject:self.allArr[btn.tag - 10]]) {
        [self.existArr removeObject:self.allArr[btn.tag - 10]];
    }else{
        [self.existArr addObject:self.allArr[btn.tag - 10]];
    }
    
    
    if ([self.defaultArr containsObject:self.allArr[btn.tag - 10]]) {
        [self.defaultArr removeObject:self.allArr[btn.tag - 10]];
    }else{
        [self.defaultArr addObject:self.allArr[btn.tag - 10]];
    }
    
}

-(void)saveAction:(UIButton*)btn {
    //年级切换
    NSDictionary *userCatchDic = [MCFileManager dictionaryInPlistFileOfPath:gp_user_info];
     NSMutableDictionary *paramsDic = [NSMutableDictionary new];
    NSMutableString *idsStr = [NSMutableString string];
    for (ProjectAllModel *model in self.existArr) {
        [idsStr appendFormat:@"%i,",model.projectId];
    }
    paramsDic[@"ids"] = idsStr;
    [[NetWorkManager shareNetWorkManager] requestDataWithUrl:[NSString stringWithFormat:@"%@%@/%@/1",gp_address_app,@"project",userCatchDic[@"baby"][@"id"]] andMethod:PUT andParams:paramsDic andSuccessCallBack:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"]  isEqualToString:@"0"]) {
            //修改成功
            if (self.updateBlock) {
                NSMutableArray *tempArr = [NSMutableArray new];
                for (ProjectAllModel *model in self.existArr) {
                    [tempArr addObject:model.projectName];
                }
                [self.navigationController popViewControllerAnimated:YES];
                self.updateBlock(tempArr);
            }
        }
    } andFailCallBack:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
    }];
    
}
@end
