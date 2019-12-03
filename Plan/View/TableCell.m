//
//  TableCell.m
//  GrowthPlan
//
//  Created by 王政 on 2019/1/2.
//  Copyright © 2019年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "TableCell.h"
#import "GPGradient.h"

@interface TableCell()
@property(nonatomic,strong)UIView *wrapperView;
@property(nonatomic,strong)UILabel *dateLabel;
@property(nonatomic,strong)UILabel *matterLabel;
@property(nonatomic,strong)UILabel *markLabel;

@property(nonatomic,strong)NSMutableArray *cellbackgroundColor;
@end

@implementation TableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
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
    self.wrapperView = [[UIView alloc]init];
    self.dateLabel = [[UILabel alloc]init];
    self.matterLabel = [[UILabel alloc]init];
    self.markLabel = [[UILabel alloc]init];
    
    [self addSubview:self.wrapperView];
    [self.wrapperView addSubview:self.dateLabel];
    [self.wrapperView addSubview:self.matterLabel];
    [self.wrapperView addSubview: self.markLabel];
    
    //布局
    
    [self.wrapperView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(screenWidth - 40);
        make.height.mas_equalTo(50);
    }];
    
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo((screenWidth - 40)/3);
        make.height.mas_equalTo(50);
    }];
    
    [self.matterLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.dateLabel.mas_right).offset(0);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo((screenWidth - 40)/3);
        make.height.mas_equalTo(50);
    }];
    
    [self.markLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.matterLabel.mas_right).offset(0);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo((screenWidth - 40)/3);
        make.height.mas_equalTo(50);
    }];
    
    //设置属性
    self.dateLabel.textColor = [UIColor GPTextThePaperColor];
    self.dateLabel.font = [UIFont systemFontOfSize:14];
    self.dateLabel.textAlignment = NSTextAlignmentCenter;
    self.dateLabel.text = @"2018年03月";
    
    self.matterLabel.textColor = [UIColor GPTextThePaperColor];
    self.matterLabel.font = [UIFont systemFontOfSize:14];
    self.matterLabel.textAlignment = NSTextAlignmentCenter;
    self.matterLabel.numberOfLines = 2;
    self.matterLabel.text = @"基础知识第二轮学习";
    
    self.markLabel.textColor = [UIColor GPTextThePaperColor];
    self.markLabel.font = [UIFont systemFontOfSize:14];
    self.markLabel.textAlignment = NSTextAlignmentCenter;
    self.markLabel.text = @"备注";
}

-(void)refreshBackColor:(NSInteger)index {
    [self.wrapperView.layer addSublayer:self.cellbackgroundColor[index % 5]];
    for (UILabel *label in self.wrapperView.subviews) {
        [self.wrapperView bringSubviewToFront:label];
    }
}

-(void)refreshUI:(PlanModel*)model {
    self.matterLabel.text = model.content;
    self.dateLabel.text = model.planMonth;
}

-(NSMutableArray *)cellbackgroundColor {
    if (_cellbackgroundColor == nil) {
        _cellbackgroundColor = [[NSMutableArray alloc]init];
        CAGradientLayer *layer1 = [GPGradient setGradualColor:CGRectMake(0, 0, screenWidth - 40, 50) fromColor:0xEAFFFD toColor:0xFCFFFF];
        CAGradientLayer *layer2 = [GPGradient setGradualColor:CGRectMake(0, 0, screenWidth - 40, 50) fromColor:0xFEE0FF toColor:0xFEFCFF];
        CAGradientLayer *layer3 = [GPGradient setGradualColor:CGRectMake(0, 0, screenWidth - 40, 50) fromColor:0xF2FFDD toColor:0xFEFFFC];
        CAGradientLayer *layer4 = [GPGradient setGradualColor:CGRectMake(0, 0, screenWidth - 40, 50) fromColor:0xDDDFFF toColor:0xFCFCFF];
        CAGradientLayer *layer5 = [GPGradient setGradualColor:CGRectMake(0, 0, screenWidth - 40, 50) fromColor:0xFFE1EA toColor:0xFACBD9];
        [_cellbackgroundColor addObject:layer1];
        [_cellbackgroundColor addObject:layer2];
        [_cellbackgroundColor addObject:layer3];
        [_cellbackgroundColor addObject:layer4];
        [_cellbackgroundColor addObject:layer5];
    }
    return _cellbackgroundColor;
}
@end
