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


@interface HomeController ()<UITableViewDelegate,UITableViewDataSource,iCarouselDelegate,iCarouselDataSource,ItemViewCellDelegate>

//UI
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)iCarousel *icarView;

//数据源
@property(nonatomic,strong)NSMutableArray *tabbleArr;
@property(nonatomic,strong)NSMutableArray *icarArr;
@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupData];
    [self setupUI];
}

-(void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = YES;
}


#pragma mark *****   data
-(void)setupData {
    
    self.icarArr = [NSMutableArray arrayWithArray:@[
   @"http://pic25.nipic.com/20121110/10839717_103723525199_2.jpg",
   @"http://pic3.nipic.com/20090619/2637387_110259061_2.jpg",
   @"http://pic26.nipic.com/20121227/10193203_131357536000_2.jpg",
                                                   ]];
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
}

#pragma mark tableView delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 7;
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
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return  cell;
    }else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"ListViewCell"];
       
    }
    
    return cell;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    HomeHearView *view = [[HomeHearView alloc]init];
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
            return 100;
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
        ((UIImageView *)view).image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.icarArr[index]]]];
        view.layer.cornerRadius = 10;
        view.clipsToBounds = YES;
//        view.contentMode = UIViewContentModeCenter;
    }  return view;
}
#pragma mark ItemViewCellDelegate

-(void)didselectedItemOnIndex:(NSInteger)index {
    
    ItemController *itemCtl = [ItemController new];
    itemCtl.navTitle = @"今日收获";
    [self.navigationController pushViewController:itemCtl animated:YES];
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
