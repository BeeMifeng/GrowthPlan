//
//  LearningController.m
//  GrowthPlan
//
//  Created by 王政 on 2018/12/26.
//  Copyright © 2018年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "LearningController.h"
#import "Masonry.h"
#import "LearningHeardCell.h"
#import "LearningMainCell.h"
#import "NetWorkManager.h"
#import "MCFileManager.h"
#import "GradeModel.h"
#import "ProjectModel.h"
#import "GPUIPickView.h"
#import "MoreProController.h"
#import "MJRefresh.h"
#import "KnowledgeModel.h"
@interface LearningController ()<UITableViewDelegate,UITableViewDataSource,LearningHeardCellDelegate,GPUIPickViewDelegate>
//UI
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)GPUIPickView *pickView;
//数据源
@property(nonatomic,strong)NSMutableArray *tabbleArr;
@property(nonatomic,strong)NSMutableArray *projectModelArr;
@property(nonatomic,strong)NSMutableArray *gradeModelArr;

@property(nonatomic,strong)NSMutableArray *projectArr;
@property(nonatomic,strong)NSMutableArray *gradeArr;
@property(nonatomic,copy)NSString *currentGrade;

@property(nonatomic,assign)NSInteger pageNum;
@end

@implementation LearningController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.projectModelArr = [NSMutableArray new];
    self.gradeModelArr = [NSMutableArray new];
    self.projectArr = [NSMutableArray new];
    self.gradeArr = [NSMutableArray new];
    self.tabbleArr = [NSMutableArray new];
    self.pageNum = 1;
    [self setupData];
    [self setupUI];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:true animated:true];
    self.tabBarController.tabBar.hidden = NO;
}

#pragma mark *****   data
-(void)setupData {
    //学科数据
    NSDictionary *userCatchDic = [MCFileManager dictionaryInPlistFileOfPath:gp_user_info];
    [[NetWorkManager shareNetWorkManager]requestDataWithUrl:[NSString stringWithFormat:@"%@%@/%@",gp_address_app,gp_learn_project,userCatchDic[@"baby"][@"id"]] andMethod:GET andParams:@{@"":@""} andSuccessCallBack:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] isEqualToString:@"0"]) {
            [self.projectArr removeAllObjects];
            [self.projectModelArr removeAllObjects];
            for (NSDictionary *dic in responseObject[@"data"]) {
                ProjectModel *model = [ProjectModel yy_modelWithDictionary:dic];
                [self.projectModelArr addObject:model];
                [self.projectArr addObject:dic[@"projectName"]];
            }
            [self.tableView reloadData];
        }
        
    } andFailCallBack:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
    }];
    
    //年级数据
    [[NetWorkManager shareNetWorkManager]requestDataWithUrl:[NSString stringWithFormat:@"%@%@/%@",gp_address_app,gp_learn_class,userCatchDic[@"baby"][@"id"]] andMethod:GET andParams:@{@"":@""} andSuccessCallBack:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"]  isEqualToString:@"0"]) {
             [self.gradeArr removeAllObjects];
             [self.gradeModelArr removeAllObjects];
            for (NSDictionary *dic in responseObject[@"data"]) {
                GradeModel *model = [GradeModel yy_modelWithDictionary:dic];
                [self.gradeModelArr addObject:model];
                [self.gradeArr addObject:dic[@"className"]];
                if ([dic[@"exist"] boolValue])self.currentGrade = dic[@"className"];
            }
            [self.tableView reloadData];
        }
        
    } andFailCallBack:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
    }];
    
    [self knowledge:1];
    
}

#pragma mark ******  知识点
-(void)knowledge:(NSInteger)page {
    //列表数据
    NSDictionary *userCatchDic = [MCFileManager dictionaryInPlistFileOfPath:gp_user_info];
    [[NetWorkManager shareNetWorkManager]requestDataWithUrl:[NSString stringWithFormat:@"%@%@/%@/%@/%li",gp_address_app,gp_learn_knowledge,userCatchDic[@"baby"][@"id"],userCatchDic[@"baby"][@"classId"],self.pageNum] andMethod:GET andParams:@{@"":@""} andSuccessCallBack:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"]  isEqualToString:@"0"]) {
            NSArray *tempArr = responseObject[@"data"];
            if (tempArr.count <= 0) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
                return;
            }
            if (self.pageNum == 1) { //删除数组数据
                [self.tabbleArr removeAllObjects];
            }
            for (NSDictionary *dic in responseObject[@"data"]) {
                KnowledgeModel *model = [KnowledgeModel yy_modelWithDictionary:dic];
                [self.tabbleArr addObject:model];
            }
            [self.tableView reloadData];
            [self.tableView.mj_header endRefreshing];
            [self.tableView.mj_footer endRefreshing];
        }
        
    } andFailCallBack:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
    }];
}

#pragma mark ******  UI
-(void)setupUI {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(safeTop);
        make.bottom.mas_equalTo(-(BarHeight));
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellEditingStyleNone;
    [self.tableView registerClass:[LearningHeardCell class] forCellReuseIdentifier:@"LearningHeardCell"];
    [self.tableView registerClass:[LearningMainCell class] forCellReuseIdentifier:@"LearningMainCell"];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
           self.pageNum = 1;
           [self setupData];
       }];
       
       self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
           self.pageNum ++;
           [self setupData];
       }];
    
}

#pragma mark tableView delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _tabbleArr.count + 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = nil;
    if (indexPath.row == 0) {
        LearningHeardCell *lCell = [tableView dequeueReusableCellWithIdentifier:@"LearningHeardCell"];
        lCell.selectionStyle = UITableViewCellSelectionStyleNone;
        [lCell refreshData:self.projectArr and:self.currentGrade];
        lCell.delegate = self;
        return lCell;
    }else{
      
        LearningMainCell *eCell = [tableView dequeueReusableCellWithIdentifier:@"LearningMainCell"];
        [eCell refreshUI:self.tabbleArr[indexPath.row - 1]];
        return eCell;
    }
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            return 160;
            break;
        default:
            return 130;
            break;
    }
}

#pragma mark 懒加载

-(UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

#pragma mark LearningHeardCellDelegate
-(void)didClickMoreBtn {
    MoreProController *mCtl = [MoreProController new];
    __weak typeof(self) weakSelf = self;
    mCtl.updateBlock = ^(NSArray *projectArr) {
        weakSelf.projectArr = [projectArr mutableCopy];
        [weakSelf setupData];
    };
    [self.navigationController pushViewController:mCtl animated:YES];
}

-(void)didClickCutGrade{
    self.pickView = [[GPUIPickView alloc]initWithdataArr:self.gradeArr];
    self.pickView.delegate = self;
}

#pragma mark GPUIPickViewDelegate
-(void)didClickSure:(NSString *)string {
    //年级切换
    NSDictionary *userCatchDic = [MCFileManager dictionaryInPlistFileOfPath:gp_user_info];
     NSMutableDictionary *paramsDic = [NSMutableDictionary new];
    for (GradeModel *model in self.gradeModelArr) {
        if ([model.className isEqualToString:string]) {
            paramsDic[@"id"] = [NSString stringWithFormat:@"%i",model.classId];
        }
    }
   
    [[NetWorkManager shareNetWorkManager] requestDataWithUrl:[NSString stringWithFormat:@"%@%@/%@",gp_address_app,@"class",userCatchDic[@"baby"][@"id"]] andMethod:PUT andParams:paramsDic andSuccessCallBack:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"]  isEqualToString:@"0"]) {
            LearningHeardCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
            [cell refreshCurrentGrade:string];
            [self setupData];
        }
    } andFailCallBack:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
    }];
}
@end
