//
//  MineController.m
//  GrowthPlan
//
//  Created by 王政 on 2018/12/26.
//  Copyright © 2018年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "MineController.h"
#import "GPGradient.h"
#import "NSDictionary+JSON.h"
#import "MenuModel.h"
#import <NSObject+YYModel.h>
#import "MineViewCell.h"
#import "MineHeard.h"
#import "MCFileManager.h"
#import "GPNaviController.h"
#import "LoginController.h"

@interface MineController ()<UITableViewDelegate,UITableViewDataSource,MineHeardDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *menuArr;
@end

@implementation MineController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
    [self setupData];
   
}

-(void)setupData {

    NSDictionary *dic = [NSDictionary readLocalFileWithName:@"Menu"];
    for (NSDictionary *menuDic in dic[@"MenuList"]) {
        MenuModel *model = [MenuModel yy_modelWithDictionary:menuDic];
        [self.menuArr addObject:model];
    }
    
}


-(void)setupUI {
    CAGradientLayer *layer = [GPGradient setGradualChangingColor:self.view fromColor:0xA2BBFF toColor:0xFFFFFF];
    layer.startPoint = CGPointMake(0, 0);
    layer.endPoint = CGPointMake(0, 1);
    layer.locations = @[@0,@0.5];
    [self.view.layer addSublayer:layer];
    
    
    [self.view addSubview:self.tableView];
    
    //布局
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(safeTop);
        make.bottom.mas_equalTo(-(BarHeight + 20));
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
    
    
    
    //设置属性
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellEditingStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView registerClass:[MineViewCell class] forCellReuseIdentifier:@"MineViewCell"];
 
    
}

#pragma mark tableView delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.menuArr.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MineViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"MineViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell refreshData:self.menuArr[indexPath.row]];
    if (indexPath.row == 0) {
        UIView *lbl = [[UIView alloc]init];
        lbl.frame = CGRectMake(20,cell.frame.size.height-2,screenWidth-40,1);
        lbl.backgroundColor = [UIColor colorFromHex:0xE3E3E3 alpha:1.0];
        [cell.contentView addSubview:lbl];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 6) {// 退出登录
        [self loginOut];
    }
}


-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    MineHeard *view = [[MineHeard alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 360)];
    view.delegate = self;
    return view;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 360;
}



-(void)viewWillAppear:(BOOL)animated {
    
   [self setStatueBackColor:[UIColor clearColor] andTextColor:UIStatusBarStyleLightContent];
}


-(void)viewWillDisappear:(BOOL)animated {
    
   [self setStatueBackColor:[UIColor whiteColor] andTextColor:UIStatusBarStyleDefault];
}

#pragma mark MineHeardDelegate
-(void)didTouchHearView:(UIImageView *)heardView {
#ifdef DEBUG
    NSLog(@"你点我头干什么");
#endif
    
}


-(void)loginOut {
    
    UIAlertController *alterCtl = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"您确定要退出吗?" preferredStyle:UIAlertControllerStyleAlert];
    
    [alterCtl addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //删除缓存回到登录页面
        if([MCFileManager removeAllFromFilePath:gp_user_info]){
            UINavigationController *nav = (UINavigationController*)[UIApplication sharedApplication].delegate.window.rootViewController;
            if([NSStringFromClass([nav.viewControllers.firstObject class]) isEqualToString:@"GPBarController"]){
                //未经过登录控制器直接登录的
                [UIApplication sharedApplication].delegate.window.rootViewController = [[GPNaviController alloc] initWithRootViewController:[LoginController new]];
            }else{
                //登录界面，登录进去的
                [self.parentViewController dismissViewControllerAnimated:YES completion:^{

                }];
            }
        }
    }]];

    [alterCtl addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

    }]];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alterCtl animated:NO completion:nil];
    });
    
}


#pragma mark 懒加载

-(UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

-(NSMutableArray *)menuArr {
    if (_menuArr == nil) {
        _menuArr = [NSMutableArray new];
    }
    return _menuArr;
}
@end
