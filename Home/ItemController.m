//
//  ItemController.m
//  GrowthPlan
//
//  Created by 王政 on 2019/1/11.
//  Copyright © 2019年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "ItemController.h"
#import "GPNaviController.h"
#import "NavListCell.h"

@interface ItemController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *talbelView;
@end

@implementation ItemController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    GPNaviController *gpNav = (GPNaviController*)self.navigationController;
    
    [gpNav setbackNav:self andTitle:self.navTitle];
    
    [self setupUI];
}

-(void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden = YES;
}

-(void)setupUI {
    
    [self.view addSubview:self.talbelView];
    
    [self.talbelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
    
    //注册cell
    [self.talbelView registerClass:[NavListCell class] forCellReuseIdentifier:@"NavListCell"];
    self.talbelView.delegate = self;
    self.talbelView.dataSource = self;
    self.talbelView.separatorStyle = UITableViewCellEditingStyleNone;
    self.talbelView.backgroundColor = [UIColor whiteColor];
    
}


#pragma mark - UITableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NavListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NavListCell"];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

#pragma mark - 懒加载

-(UITableView *)talbelView {
    if (!_talbelView) {
        _talbelView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    }
    return _talbelView;
}
@end
