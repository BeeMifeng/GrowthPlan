//
//  NavListCell.m
//  GrowthPlan
//
//  Created by 李嘉伦 on 2019/12/2.
//  Copyright © 2019 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "NavListCell.h"
#import "UIColor+Hex.h"
@interface NavListCell()
@property(nonatomic,strong)UILabel *timeLabel;
@property(nonatomic,strong)UIImageView *seeImg;
@property(nonatomic,strong)UILabel *seeLabel;
@property(nonatomic,strong)UILabel *contentLabel;
@end
@implementation NavListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style
                reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}


-(void)setupUI {
    
    //初始化
    _timeLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    _seeImg = [[UIImageView alloc]initWithFrame:CGRectZero];
    _seeLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    _contentLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    
    
    
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(10,10,screenWidth-20,120);
    view.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor;
    view.layer.cornerRadius = 8;
    view.layer.shadowColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:0.5].CGColor;
    view.layer.shadowOffset = CGSizeMake(0,3);
    view.layer.shadowOpacity = 1;
    view.layer.shadowRadius = 8;
    UIImageView  *markImg = [[UIImageView alloc]initWithFrame:CGRectMake(20, 10, 7, 20)];
    [self addSubview:view];
    [view addSubview:markImg];
    
    [view addSubview:_timeLabel];
    [view addSubview:_seeImg];
    [view addSubview:_seeLabel];
    [view addSubview:_contentLabel];
    
    
    //定位
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(markImg.mas_right).offset(10);
        make.top.mas_equalTo(10);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(22);
    }];
    
    [_seeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-5);
        make.top.mas_equalTo(10);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(20);
    }];
    
    [_seeImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_seeLabel.mas_left).offset(0);
        make.top.mas_equalTo(12);
        make.width.mas_equalTo(16);
        make.height.mas_equalTo(16);
    }];
    
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_timeLabel.mas_bottom).offset(5);
        make.bottom.mas_equalTo(10);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
    }];
    
    
    //设置属性
    markImg.image = [UIImage imageNamed:@"yuwen"];
  
    _timeLabel.font = [UIFont systemFontOfSize:18];
    _timeLabel.text = @"2018-10-23";
    
    
    _seeImg.image = [UIImage imageNamed:@"support"];
    
    
    _seeLabel.font = [UIFont systemFontOfSize:15];
    _seeLabel.textColor = [UIColor colorFromHex:0x999999 alpha:1.0];
    _seeLabel.text = @"9999";
    
    
    _contentLabel.numberOfLines = 0;
    _contentLabel.font = [UIFont systemFontOfSize:16];
    _contentLabel.textColor = [UIColor colorFromHex:0x999999 alpha:1.0];
    _contentLabel.text = @"从 2015 年 4 月起，Ant Design 在蚂蚁金服中后台产品线迅速推广，对接多条业务线，覆盖系统 800 个以上。定位";
    
}

@end
