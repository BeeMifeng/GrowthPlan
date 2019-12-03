//
//  MineHeard.m
//  GrowthPlan
//
//  Created by 王政 on 2019/1/3.
//  Copyright © 2019年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "MineHeard.h"
#import "DateItem.h"
#import "GPGradient.h"
#import "MCFileManager.h"
#import "NetWorkManager.h"
#import "SginModel.h"
#import "SVProgressHUD.h"
@interface MineHeard()
@property(nonatomic,strong)UIImageView *heardView;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *growthID;
@property(nonatomic,strong)UIView *writeView; //更改按键的外层View 增大点击热区
@property(nonatomic,strong)UIView *signView;
@property(nonatomic,strong)UIButton *signBtn;

@property(nonatomic,strong)NSMutableArray<SginModel*> *signArr;
@end

@implementation MineHeard
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}


-(void)setupUI {
    
    _signArr = [NSMutableArray new];
    
    UIView *wrapperView = [[UIView alloc]init];
    self.heardView = [[UIImageView alloc]init];
    self.nameLabel = [[UILabel alloc]init];
    self.growthID = [[UILabel alloc]init];
    self.writeView = [[UIView alloc]init];
    UIImageView *writeImg = [UIImageView new];
    
    self.signView = [[UIView alloc]init];
    self.signBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.signBtn.frame = CGRectMake(0, (screenWidth - 32)/7, screenWidth - 32, (screenWidth - 32)/7);
    [self.signView addSubview:self.signBtn];
    
    for (NSInteger i = 0; i < 7; i ++) {
        DateItem *date = [[DateItem alloc]initWithFrame:CGRectMake((screenWidth - 32)/7 * i, 0, (screenWidth - 32)/7, (screenWidth - 32)/7)];
        date.tag = 10 + i;
        [self.signView addSubview:date];
    }
    
    
    [self addSubview:wrapperView];
    [self addSubview:self.heardView];
    [wrapperView addSubview:self.nameLabel];
    [wrapperView addSubview:self.growthID];
    [wrapperView addSubview:self.writeView];
    [self.writeView addSubview:writeImg];
    [self addSubview:self.signView];
    
    //布局
    [wrapperView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(95);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(118);
    }];
    
    [self.signView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(wrapperView.mas_bottom).offset(30);
        make.left.mas_equalTo(16);
        make.right.mas_equalTo(-16);
        make.height.mas_equalTo((screenWidth - 32)/7*2);
    }];
    
    [self.heardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(59);
        make.left.mas_equalTo((screenWidth - 78)/2);
        make.width.mas_equalTo(78);
        make.height.mas_equalTo(78);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(45);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(30);
    }];
    
    [self.growthID mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.nameLabel.mas_bottom).offset(5);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(30);
    }];
    
    [self.writeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.width.mas_equalTo(32);
        make.height.mas_equalTo(32);
    }];
    
    [writeImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(8);
        make.left.mas_equalTo(8);
        make.width.mas_equalTo(16);
        make.height.mas_equalTo(16);
    }];
    
    //设置属性
    wrapperView.backgroundColor = [UIColor colorFromHex:0xFFFFFF alpha:0.5];
    wrapperView.layer.cornerRadius = 5;
    wrapperView.layer.shadowOpacity = 0.5;
    wrapperView.layer.shadowOffset = CGSizeMake(1, 1);//偏移距离
    wrapperView.layer.shadowRadius = 3.0;//半径
    wrapperView.layer.shadowColor = [UIColor colorFromHex:0xDFE8FF alpha:1.0].CGColor;
    
    self.heardView.layer.cornerRadius = 39;
    self.heardView.clipsToBounds = YES;
    self.heardView.image = [UIImage imageNamed:@"placeImg"];
    
     NSDictionary *userCatchDic = [MCFileManager dictionaryInPlistFileOfPath:gp_user_info];
    
    
    self.nameLabel.text = userCatchDic[@"user"][@"nickname"];
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    self.nameLabel.font = [UIFont systemFontOfSize:20];
    self.nameLabel.textColor = [UIColor colorFromHex:0x333333 alpha:1.0];
    
    self.growthID.text = [NSString stringWithFormat:@"成长号：%@",userCatchDic[@"baby"][@"grownNo"]];
    self.growthID.textAlignment = NSTextAlignmentCenter;
    self.growthID.font = [UIFont systemFontOfSize:15];
    self.growthID.textColor = [UIColor colorFromHex:0x666666 alpha:1.0];
    
    
    writeImg.image = [UIImage imageNamed:@"change"];
    
    [self.signBtn setTitle:@"签到" forState:UIControlStateNormal];
    [self.signBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    CAGradientLayer *layer = [GPGradient setGradualChangingColor:self.signBtn fromColor:0x6891FF toColor:0x356DFF];
    [self.signBtn.layer addSublayer:layer];
    [self.signBtn bringSubviewToFront:self.signBtn.titleLabel];
    self.signBtn.layer.shadowColor = [UIColor GPTextTitleColor].CGColor;
    self.signBtn.layer.shadowOffset = CGSizeMake(2, 2);//偏移距离
    self.signBtn.layer.shadowOpacity = 1;//不透明度
    self.signBtn.layer.shadowRadius = 4.0;//半径
    
    //添加点击事件
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hearViewTapAction:)];
    [self.heardView addGestureRecognizer:tap];
    self.heardView.userInteractionEnabled = true;
    
    
    UITapGestureRecognizer *editTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(writerViewTapAction:)];
       [self.writeView addGestureRecognizer:editTap];
       self.writeView.userInteractionEnabled = true;
    
    [self.signBtn addTarget:self action:@selector(signAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self setupData];
}

-(void)hearViewTapAction:(UITapGestureRecognizer*)tap {
    
    if (_delegate && [_delegate respondsToSelector:@selector(didTouchHearView:)]) {
        [_delegate didTouchHearView:self.heardView];
    }
}

-(void)writerViewTapAction:(UITapGestureRecognizer*)tap {
    if (_delegate && [_delegate respondsToSelector:@selector(didTouchEditView:)]) {
        [_delegate didTouchEditView:self.heardView];
    }
}



//签到数据
-(void)setupData {
    [_signArr removeAllObjects];
    NSDictionary *userCatchDic = [MCFileManager dictionaryInPlistFileOfPath:gp_user_info];
    [[NetWorkManager shareNetWorkManager]requestDataWithUrl:[NSString stringWithFormat:@"%@%@/%@",gp_address_app,gp_sign,userCatchDic[@"user"][@"id"]] andMethod:GET andParams:@{@"":@""} andSuccessCallBack:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] isEqualToString:@"0"]) {
            for (NSDictionary *dic in responseObject[@"data"]) {
                SginModel *model = [SginModel yy_modelWithDictionary:dic];
                [self.signArr addObject:model];
            }
            //刷新数据
            [self refreshDateUI];
        }
    } andFailCallBack:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
    }];
}


-(void)signAction:(UIButton*)btn {
    NSDictionary *userCatchDic = [MCFileManager dictionaryInPlistFileOfPath:gp_user_info];
    [[NetWorkManager shareNetWorkManager]requestDataWithUrl:[NSString stringWithFormat:@"%@%@/%@",gp_address_app,gp_sign,userCatchDic[@"user"][@"id"]] andMethod:POST andParams:@{@"":@""} andSuccessCallBack:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] isEqualToString:@"0"]) {
            //刷新数据
             [SVProgressHUD showSuccessWithStatus:@"签到成功"];
             [SVProgressHUD dismissWithDelay:2.0];
             [self setupData];
        }else
        {
             [SVProgressHUD showInfoWithStatus:responseObject[@"msg"]];
             [SVProgressHUD dismissWithDelay:2.0];
        }
    } andFailCallBack:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
    }];
}


-(void)refreshDateUI {
    for (NSInteger i = 0; i < self.signArr.count; i ++) {
        DateItem *date = [self.signView viewWithTag:10+i];
        [date refreshUIWithSignMode:self.signArr[i]];
    }
}

@end
