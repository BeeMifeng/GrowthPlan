//
//  BillController.m
//  GrowthPlan
//
//  Created by 李嘉伦 on 2019/11/29.
//  Copyright © 2019 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "BillController.h"
#import "GPNaviController.h"
#import "UIColor+Hex.h"
#import "BillViewCell.h"
#import "NetWorkManager.h"
#import "MCFileManager.h"
#import "BillModel.h"
@interface BillController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray<BillModel*> *billArr;
@end

@implementation BillController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    GPNaviController *gpNav = (GPNaviController*)self.navigationController;
    [gpNav setbackNav:self andTitle:@"购买记录"];
    _billArr = [NSMutableArray new];
    [self setup];
    [self setupData];
    
}

-(void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden = YES;
}

-(void)setup {
    [self.view addSubview:self.tableView];
   //布局
   [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.mas_equalTo(0);
       make.bottom.mas_equalTo(-safeBottom);
       make.left.mas_equalTo(0);
       make.right.mas_equalTo(0);
   }];
    
    
    [self.tableView registerClass:[BillViewCell class] forCellReuseIdentifier:@"BillViewCell"];
    
  //设置属性
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  self.tableView.separatorStyle = UITableViewCellEditingStyleNone;
  self.tableView.backgroundColor = [UIColor whiteColor];
  self.tableView.estimatedSectionHeaderHeight = 0;
  self.tableView.estimatedSectionFooterHeight = 0;
}


-(void)setupData {
    
    NSDictionary *userCatchDic = [MCFileManager dictionaryInPlistFileOfPath:gp_user_info];
    [[NetWorkManager shareNetWorkManager]requestDataWithUrl:[NSString stringWithFormat:@"%@%@/%@/1",gp_address_app,gp_order_list,userCatchDic[@"user"][@"id"]] andMethod:POST andParams:@{@"":@""} andSuccessCallBack:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] isEqualToString:@"0"]) {
            for (NSDictionary *dic in responseObject[@"data"]) {
                BillModel *model = [BillModel yy_modelWithDictionary:dic];
                [self.billArr addObject:model];
            }
        }
    } andFailCallBack:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
   
    }];
}


#pragma mark tableView delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BillViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BillViewCell"];
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.001;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001;
}

#pragma mark 懒加载

-(UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

@end
