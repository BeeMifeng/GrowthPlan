//
//  BillViewCell.m
//  GrowthPlan
//
//  Created by 李嘉伦 on 2019/11/29.
//  Copyright © 2019 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "BillViewCell.h"
#import "UIColor+Hex.h"

@interface BillViewCell()
@property(nonatomic,strong)UILabel *timeLable;
@property(nonatomic,strong)UILabel *orderNumber;
@property(nonatomic,strong)UILabel *money;
@property(nonatomic,strong)UILabel *paymentTime;
@end

@implementation BillViewCell

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
    
    
    self.timeLable = [UILabel new];
    self.orderNumber = [UILabel new];
    self.money = [UILabel new];
    self.paymentTime = [UILabel new];
    
    [view addSubview:self.timeLable];
    [view addSubview:self.orderNumber];
    [view addSubview:self.money];
    [view addSubview:self.paymentTime];
    
    [self addSubview:view];
    [view addSubview:markImg];
    
    //布局
    [self.timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(markImg.mas_right).offset(10);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(20);
    }];
    
    [self.orderNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.timeLable.mas_bottom).offset(10);
        make.left.mas_equalTo(35);
        make.right.mas_equalTo(-35);
        make.height.mas_equalTo(20);
    }];
    
    [self.money mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.orderNumber.mas_bottom).offset(5);
        make.left.mas_equalTo(35);
        make.right.mas_equalTo(-35);
        make.height.mas_equalTo(20);
    }];
    
    [self.paymentTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.money.mas_bottom).offset(5);
        make.left.mas_equalTo(35);
        make.right.mas_equalTo(-35);
        make.height.mas_equalTo(20);
    }];
    
    
    
    
    //设置属性
    markImg.image = [UIImage imageNamed:@"yuwen"];
    
    self.timeLable.font = [UIFont systemFontOfSize:18];
    self.timeLable.text = @"2019-10-12";
    
    self.orderNumber.font = [UIFont systemFontOfSize:16];
    self.orderNumber.text = @"订单号：20180901902900830";
    self.orderNumber.textColor = [UIColor GPTextThePaperColor];
    
    self.money.font = [UIFont systemFontOfSize:16];
    self.money.text = @"订单金额：2000.54元";
    self.money.textColor = [UIColor GPTextThePaperColor];
    
    self.paymentTime.font = [UIFont systemFontOfSize:16];
    self.paymentTime.text = @"支付时间：2016.09.23";
    self.paymentTime.textColor = [UIColor GPTextThePaperColor];
    
      
    
}


@end
