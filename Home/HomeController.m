//
//  HomeController.m
//  GrowthPlan
//
//  Created by 王政 on 2018/12/26.
//  Copyright © 2018年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "HomeController.h"
#import "HomeHearView.h"
#import "Masonry.h"
#import "iCarousel.h"
#import "ItemViewCell.h"
#import "ListViewCell.h"
#import "ItemController.h"
#import "NavItemModel.h"
#import "NetWorkManager.h"
#import "MJRefresh.h"
#import "MCFileManager.h"
#import "UIImageView+WebCache.h"
#import "HomeArticle.h"
#import "ContactUSController.h"
#import "HomeDetailController.h"

@interface HomeController ()<UITableViewDelegate,UITableViewDataSource,iCarouselDelegate,iCarouselDataSource,ItemViewCellDelegate,HomeHearViewDelegate>

//UI
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)iCarousel *icarView;

//数据源
@property(nonatomic,strong)NSMutableArray *tabbleArr;
@property(nonatomic,strong)NSMutableArray *icarArr;
@property(nonatomic,strong)NSMutableArray *NavItemArr;

@property(nonatomic,assign)NSInteger pageNum;
@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.pageNum = 1;
    [self initObject];
    [self setupData];
    [self setupUI];
}

-(void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = NO;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

#pragma mark *****   初始化属性（数组、字典等）
-(void)initObject {
    self.tabbleArr = [NSMutableArray new];
    self.icarArr = [NSMutableArray new];
    self.NavItemArr = [NSMutableArray new];
}

#pragma mark *****   data
-(void)setupData {
    //广告
    [[NetWorkManager shareNetWorkManager] requestDataWithUrl:[NSString stringWithFormat:@"%@%@%@",gp_address_app,gp_banner,@"/3"] andMethod:GET andParams:@{@"":@""} andSuccessCallBack:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] isEqualToString:@"0"]) {
            self.icarArr = responseObject[@"data"];
            [self.icarView reloadData];
            [self.tableView reloadData];
        }
    } andFailCallBack:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
    }];
    
    //动态获取主界面功能按钮
    [[NetWorkManager shareNetWorkManager] requestDataWithUrl:[NSString stringWithFormat:@"%@%@",gp_address_app,gp_homeNavItme] andMethod:GET andParams:@{@"":@""} andSuccessCallBack:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"]isEqualToString:@"0"]) {
            [self.NavItemArr removeAllObjects];
            for (NSDictionary *dic in responseObject[@"data"]) {
                NavItemModel *model = [NavItemModel yy_modelWithDictionary:dic];
                [self.NavItemArr addObject:model];
            }
            [self.icarView reloadData];
            [self.tableView reloadData];
        }
    } andFailCallBack:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
    }];
    
    
    //文章列表
    [[NetWorkManager shareNetWorkManager] requestDataWithUrl:[NSString stringWithFormat:@"%@%@%li",gp_address_app,gp_home_articl,self.pageNum] andMethod:POST andParams:@{@"userId":[GPUserCatch getBodyId]} andSuccessCallBack:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"]  isEqualToString:@"0"]) {
            if (self.pageNum == 1) {
                [self.tabbleArr removeAllObjects];
            }
            
            //返回文章列表数组，转模型存数组
            NSArray *tempArr = responseObject[@"data"];
            if (tempArr.count <= 0) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
                return;
            }
            
            for (NSDictionary *dic in responseObject[@"data"]) {
                HomeArticle *articleModel = [HomeArticle yy_modelWithDictionary:dic];
                [self.tabbleArr addObject:articleModel];
            }
            [self.icarView reloadData];
            [self.tableView reloadData];
        }
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
    } andFailCallBack:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
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
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"homeCell"];
    [self.tableView registerClass:[ItemViewCell class] forCellReuseIdentifier:@"ItemViewCell"];
    [self.tableView registerClass:[ListViewCell class] forCellReuseIdentifier:@"ListViewCell"];
    
    self.icarView.dataSource = self;
    self.icarView.delegate = self;
    
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
    
    return self.tabbleArr.count + 2;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = nil;
    if (indexPath.row == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"homeCell"];
        self.icarView.frame = CGRectMake(0, 0, screenWidth, screenWidth/1.8);
        self.icarView.type = 1;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell addSubview:self.icarView];
    }else if (indexPath.row == 1){
       
        ItemViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemViewCell"];
        cell.delegate = self;
        [cell refreshUIWithModel:self.NavItemArr];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return  cell;
    }else
    {
       ListViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ListViewCell"];
       [cell refreshUI:self.tabbleArr[indexPath.row-2]];
       return cell;
    }
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row != 0 && indexPath.row != 1){
        //  前往详情页
        HomeDetailController *hCtl = [HomeDetailController new];
        hCtl.articleModel = self.tabbleArr[indexPath.row - 2];
        [self.navigationController pushViewController:hCtl animated:YES];
    }
}


-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    HomeHearView *view = [[HomeHearView alloc]init];
    view.delegate = self;
    view.frame = CGRectMake(0, 0, screenWidth, 68);
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 68;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
             return screenWidth/1.8;
            break;
        case 1:
            return 100 * self.NavItemArr.count/4;
            break; 
        default:
            return 100;
            break;
    }
}

#pragma mark tableView icardView

- (NSInteger)numberOfItemsInCarousel:(__unused iCarousel *)carousel {
    
    return self.icarArr.count;
}

- (UIView *)carousel:(__unused iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    //create new view if no view is available for recycling
    if (view == nil)
    {
        view = [[UIImageView alloc] initWithFrame:CGRectMake(20, 0, screenWidth-40, (screenWidth-40)/1.8)];
        [((UIImageView *)view) sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",gp_address,self.icarArr[index]]]];
        view.layer.cornerRadius = 10;
        view.clipsToBounds = YES;
    }else
    {
       [((UIImageView *)view) sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",gp_address,self.icarArr[index]]]];
    }
    
    return view;
}
#pragma mark ItemViewCellDelegate

-(void)didselectedItemOnIndex:(NSInteger)index {
    
    ItemController *iCtl = [ItemController new];
    NavItemModel *model = self.NavItemArr[index];
    iCtl.navTitle = model.name;
    [self.navigationController pushViewController:iCtl animated:YES];
}

#pragma mark HomeHearViewDelegate

-(void)didSelectedContectUs:(UIView *)view {
    ContactUSController *contect = [ContactUSController new];
    [self.navigationController pushViewController:contect animated:YES];
}

#pragma mark 懒加载

-(UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

-(iCarousel *)icarView {
    if (_icarView == nil) {
        _icarView = [[iCarousel alloc] init];
    }
    return _icarView;
}

-(NSMutableArray *)tabbleArr {
    if (_tabbleArr == nil) {
        _tabbleArr = [NSMutableArray new];
    }
    return _tabbleArr;
}

- (NSMutableArray *)icarArr {
    if (_icarArr == nil) {
        _icarArr = [NSMutableArray new];
    }
    return _icarArr;
}

@end
