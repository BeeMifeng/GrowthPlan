//
//  PlanController.m
//  GrowthPlan
//
//  Created by 王政 on 2018/12/26.
//  Copyright © 2018年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "PlanController.h"
#import "GPGradient.h"
#import "PlanHeardCell.h"
#import "TableCell.h"

#import "NetWorkManager.h"
#import "MCFileManager.h"
#import "PlanModel.h"


@interface PlanController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UIButton *payBtn;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIView *sectionOneHeard;
@property(nonatomic,strong)NSMutableArray *planArr;

@end

@implementation PlanController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _planArr = [NSMutableArray new];
    
    [self setupUI];
    
    [self setupData];
}

-(void)setupUI {
    
    self.payBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.payBtn];
    //布局
    [self.payBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-(40 + BarHeight));
        make.left.mas_equalTo(40);
        make.right.mas_equalTo(-40);
        make.height.mas_equalTo(44);
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(safeTop);
        make.bottom.mas_equalTo(self.payBtn.mas_top).offset(-20);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
    
    
    //设置属性
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellEditingStyleNone;
    [self.tableView registerClass:[PlanHeardCell class] forCellReuseIdentifier:@"PlanHeardCell"];
    [self.tableView registerClass:[TableCell class] forCellReuseIdentifier:@"TableCell"];
    

    
    [self.payBtn setTitle:@"定制专属成长计划" forState:UIControlStateNormal];
    [self.payBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.payBtn.layer.cornerRadius = 6;
    self.payBtn.clipsToBounds = YES;
    
}

//布局完成后添加layer  否则拿不到frame
-(void)viewDidLayoutSubviews {
   
    CAGradientLayer *btnLayer = [GPGradient setGradualChangingColor:self.payBtn fromColor:0x356DFF toColor:0x6891FF];
    [self.payBtn.layer addSublayer:btnLayer];
    [self.payBtn bringSubviewToFront:self.payBtn.titleLabel];
}

#pragma mark 网络请求
-(void)setupData {
    //学科数据
    NSDictionary *userCatchDic = [MCFileManager dictionaryInPlistFileOfPath:gp_user_info];
    [[NetWorkManager shareNetWorkManager]requestDataWithUrl:[NSString stringWithFormat:@"%@%@/%@",gp_address_app,gp_plan_profession,userCatchDic[@"baby"][@"id"]] andMethod:GET andParams:@{@"":@""} andSuccessCallBack:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] isEqualToString:@"0"]) {
           for (NSDictionary *dic in responseObject[@"data"]) {
               PlanModel *model = [PlanModel yy_modelWithDictionary:dic];
               [self.planArr addObject:model];
           }
            [self.tableView reloadData];
        }
    } andFailCallBack:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
    }];
    
}

#pragma mark tableView delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return self.planArr.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = nil;
    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"PlanHeardCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }else{
        TableCell *tCell = [tableView dequeueReusableCellWithIdentifier:@"TableCell"];
        tCell.selectionStyle = UITableViewCellSelectionStyleNone;
        [tCell refreshBackColor:indexPath.row];
        [tCell refreshUI:self.planArr[indexPath.row]];
        return tCell;
        
    }
    return cell;
}


-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section == 1) {
        return self.sectionOneHeard;
    }
    return [[UIView alloc]init];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
            return 230;
            break;
        default:
            return 50;
            break;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return 50;
    }
    return 0.001;
}


#pragma mark 懒加载

-(UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

-(UIView *)sectionOneHeard {
   
    if (_sectionOneHeard == nil) {
        _sectionOneHeard = [[UIView alloc]initWithFrame:CGRectMake(20, 0, screenWidth - 40,50)];
        UILabel *dataView = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, (screenWidth - 40)/3, 50)];
        UILabel *matterView = [[UILabel alloc]initWithFrame:CGRectMake(20 + (screenWidth - 40)/3, 0, (screenWidth - 40)/3, 50)];
        UILabel *markView = [[UILabel alloc]initWithFrame:CGRectMake(20 + (screenWidth - 40)/3*2, 0, (screenWidth - 40)/3, 50)];
        [_sectionOneHeard addSubview:matterView];
        [_sectionOneHeard addSubview:markView];
        [_sectionOneHeard addSubview:dataView];
        
        dataView.text = @"日期";
        
        matterView.text = @"事项";
        
        markView.text = @"备注";
        
        for (UILabel *view  in _sectionOneHeard.subviews) {
            view.backgroundColor = [UIColor colorFromHex:0x5080FF alpha:1.0];
            view.textColor = [UIColor whiteColor];
            view.font = [UIFont systemFontOfSize:15 weight:200];
            view.textAlignment = NSTextAlignmentCenter;
        }
   
    }
    return _sectionOneHeard;
}



@end
