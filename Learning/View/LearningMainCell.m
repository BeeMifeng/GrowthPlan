//
//  LearningMainCell.m
//  GrowthPlan
//
//  Created by 王政 on 2018/12/29.
//  Copyright © 2018年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "LearningMainCell.h"
#import "Masonry.h"
@interface LearningMainCell()
@property(nonatomic,strong)UIImageView *markView;
@property(nonatomic,strong)UILabel *discipline;
@property(nonatomic,strong)UIImageView *see;
@property(nonatomic,strong)UILabel *seeNum;
@property(nonatomic,strong)UILabel *thePaper;
@property(nonatomic,strong)UILabel *content;
@end

@implementation LearningMainCell

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
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UIView *wrapper = [[UIView alloc]init];
    self.markView = [[UIImageView alloc]init];
    self.discipline = [UILabel new];
    self.see = [UIImageView new];
    self.seeNum = [UILabel new];
    self.thePaper = [UILabel new];
    self.content = [UILabel new];
    
    [wrapper addSubview:self.markView];
    [wrapper addSubview:self.discipline];
    [wrapper addSubview:self.see];
    [wrapper addSubview:self.seeNum];
    [wrapper addSubview:self.thePaper];
    [wrapper addSubview:self.content];
    
    [self addSubview:wrapper];
    
    //布局
    [wrapper mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(108);
    }];
    
   
    
    [self.markView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(17);
        make.width.mas_equalTo(7);
        make.height.mas_equalTo(14);
    }];
    
    [self.discipline mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.markView.mas_right).offset(10);
        make.top.mas_equalTo(14);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(21);
    }];
    
    [self.see mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.discipline.mas_right).offset(24);
        make.top.mas_equalTo(19);
        make.width.mas_equalTo(16);
        make.height.mas_equalTo(16);
    }];
    
    [self.seeNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.see.mas_right).offset(4);
        make.top.mas_equalTo(17);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(20);
    }];
    
    [self.thePaper mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(21);
        make.top.mas_equalTo(self.discipline.mas_bottom).offset(10);
        make.right.mas_equalTo(-2);
        make.height.mas_equalTo(20);
    }];
    
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(21);
        make.top.mas_equalTo(self.thePaper.mas_bottom).offset(6);
        make.right.mas_equalTo(-2);
        make.height.mas_equalTo(20);
    }];
    
    
    //设置属性
    wrapper.backgroundColor = [UIColor whiteColor];
    wrapper.layer.cornerRadius = 4;
    wrapper.layer.shadowColor = [UIColor GPTextTitleColor].CGColor;
    wrapper.layer.shadowOffset = CGSizeMake(1, 1);//偏移距离
    wrapper.layer.shadowOpacity = 0.5;//不透明度
    wrapper.layer.shadowRadius = 3.0;//半径
    
    self.markView.image = [UIImage imageNamed:@"yuwen"];
    
    self.discipline.text = @"语文";
    self.discipline.font = [UIFont systemFontOfSize:15];
    
    self.see.image = [UIImage imageNamed:@"see"];
    
    self.seeNum.text = @"1234";
    self.seeNum.textColor = [UIColor GPTextTitleColor];
    self.seeNum.font = [UIFont systemFontOfSize:13];
    
    self.thePaper.text = @"AntV 是蚂蚁金服全新一代数据可视化解";
    self.thePaper.font = [UIFont systemFontOfSize:13];
    self.thePaper.textColor = [UIColor GPTextThePaperColor];
    
    self.content.text = @"Ant Design是一个服务于企业级产品的设计体系，基于『确定』和『自然』的设计价值观和模块化的解决方案，让设计者专注于更好的用户体验。";
    self.content.font = [UIFont systemFontOfSize:13];
    self.content.textColor = [UIColor GPTextTheTimeColor];
    
}

-(void)refreshUI:(KnowledgeModel*)model {
    
    self.discipline.text = model.projectName;
    self.content.text = model.content;
    self.seeNum.text = model.readCount;
    self.thePaper.text = [model.content substringToIndex:20];
    
}

@end
