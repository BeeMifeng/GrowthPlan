//
//  LearningHeardCell.m
//  GrowthPlan
//
//  Created by 王政 on 2018/12/28.
//  Copyright © 2018年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "LearningHeardCell.h"
#import "Masonry.h"
#import "GPGradient.h"
@interface LearningHeardCell()
@property(nonatomic,strong)NSArray *itemArr;

@property(nonatomic,strong)UIView *wrapper;
@end

@implementation LearningHeardCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup {
    self.itemArr = @[@"语文",@"数学",@"英语",@"地理",@"历史",@"物理",@"生化",@"政治",@"语文",@"更多"];
     CGFloat marging = 0;
    if (screenWidth <= 640) {
        marging = (screenWidth - 40 - 50*5)/4;
    }else {
        marging = (screenWidth - 50 - 60*5)/4;
    }
    
    for (NSInteger i = 0; i < 2; i++) {
        for (NSInteger j = 0; j < 5; j ++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            
            if (screenWidth <= 640) {
                //640屏幕 及以下屏幕会重叠,适配6代 5代
              btn.frame = CGRectMake(20 + (50 + marging)* j, 10+(20+20)*i, 50, 20);
            }else
            {
              btn.frame = CGRectMake(25 + (60 + marging)* j, 10+(20+24)*i, 60, 24);
            }
            btn.tag = 10 + i*5 + j;
            [btn setTitleColor:[UIColor GPTextThePaperColor] forState:UIControlStateNormal];
            [btn setTitle:self.itemArr[i*5 + j] forState:UIControlStateNormal];
            [self addSubview:btn];

            btn.backgroundColor = [UIColor whiteColor];
            btn.titleLabel.font = [UIFont systemFontOfSize:13];
            btn.layer.cornerRadius = 12;
            btn.layer.shadowColor = [UIColor GPTextTitleColor].CGColor;
            btn.layer.shadowOffset = CGSizeMake(1, 1);//偏移距离
            btn.layer.shadowOpacity = 0.5;//不透明度
            btn.layer.shadowRadius = 3.0;//半径
            
        }
    }
    
     //grade
    self.wrapper = [[UIView alloc] initWithFrame:CGRectMake(20, 100, screenWidth - 40, 41)];
    [self addSubview:self.wrapper];
    CAGradientLayer *graderLayer =  [GPGradient setGradualChangingColor:self.wrapper fromColor:0x356DFF toColor:0x6891FF];
    [self.wrapper.layer addSublayer:graderLayer];
    self.wrapper.layer.cornerRadius = 20.5;
    self.wrapper.clipsToBounds = YES;
    
    
    UILabel *curent = [[UILabel alloc]init];
    UILabel *grade = [[UILabel alloc]init];
    [self.wrapper addSubview:curent];
    [self.wrapper addSubview:grade];
    
    UIView *switchView = [[UIView alloc]init];
    UIImageView *switchImage = [[UIImageView  alloc]init];
    UILabel *switchLabel =  [[UILabel alloc]init];
    [self.wrapper addSubview:switchView];
    [switchView addSubview:switchImage];
    [switchView addSubview:switchLabel];
    
    
    //自动布局
    [curent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(28);
        make.top.mas_equalTo(12);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(17);
    }];
    
    [grade mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(curent.mas_right).offset(4);
        make.top.mas_equalTo(8);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(21);
    }];
    
    [switchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(10);
        make.width.mas_equalTo(46);
        make.height.mas_equalTo(20);
    }];
    
    [switchLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(1.5);
        make.right.mas_equalTo(0);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(17);
    }];
    
    [switchImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(switchLabel.mas_left).offset(-1);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(20);
    }];
    
    
    curent.textColor = [UIColor whiteColor];
    curent.font = [UIFont systemFontOfSize:12];
    curent.textAlignment = NSTextAlignmentCenter;
    curent.text = @"当前年级:";
    
    grade.textColor = [UIColor whiteColor];
    grade.font = [UIFont systemFontOfSize:15];
    grade.text = @"六年级";
    
    
    switchLabel.textColor = [UIColor whiteColor];
    switchLabel.font = [UIFont systemFontOfSize:12];
    switchLabel.textAlignment = NSTextAlignmentCenter;
    switchLabel.text = @"切换";
    
    switchImage.image = [UIImage imageNamed:@"switch"];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
