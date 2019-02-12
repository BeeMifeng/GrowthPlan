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
@interface LearningController ()<UITableViewDelegate,UITableViewDataSource>
//UI
@property(nonatomic,strong)UITableView *tableView;

//数据源
@property(nonatomic,strong)NSMutableArray *tabbleArr;
@end

@implementation LearningController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupData];
    [self setupUI];
}


#pragma mark *****   data
-(void)setupData {

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
    
}

#pragma mark tableView delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 7;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = nil;
    if (indexPath.row == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"LearningHeardCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }else{
      
        cell = [tableView dequeueReusableCellWithIdentifier:@"LearningMainCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
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
@end
