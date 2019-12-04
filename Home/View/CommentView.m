//
//  CommentView.m
//  GrowthPlan
//
//  Created by 李嘉伦 on 2019/12/4.
//  Copyright © 2019 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "CommentView.h"
#import "UIImageView+WebCache.h"
#import "UIColor+Hex.h"
#import "GPNSdate.h"
#import "UILabel+ChangeLineSpaceAndWordSpace.h"
@interface CommentView ()
@property(nonatomic,strong)UIImageView *hearImg;
@property(nonatomic,strong)UILabel *nickname;
@property(nonatomic,strong)UILabel *createTime;
@property(nonatomic,strong)UILabel *comment;
@end

@implementation CommentView

-(instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup {
    _hearImg = [UIImageView new];
    _nickname = [UILabel new];
    _createTime = [UILabel new];
    _comment = [UILabel new];
    
    [self addSubview:_hearImg];
    [self addSubview:_nickname];
    [self addSubview:_createTime];
    [self addSubview:_comment];
    
    
    [_hearImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(5);
        make.left.mas_equalTo(10);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
    
    [_nickname mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(_hearImg.mas_right).offset(5);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(20);
    }];
    
    [_createTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(20);
    }];
    
    [_comment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_nickname.mas_bottom).offset(5);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(0);
    }];
    
    
    //设置属性
    _hearImg.image = [UIImage imageNamed:@"logo"];
    _hearImg.layer.cornerRadius = 25;
    _hearImg.clipsToBounds = YES;
    
    _nickname.text = @"Michael Johnson";
    _nickname.font = [UIFont systemFontOfSize:14];
    _nickname.textColor = [UIColor colorFromHex:0x386FFF alpha:1.0];
    
    _createTime.text = @"2018-11";
    _createTime.font = [UIFont systemFontOfSize:12];
    _createTime.textAlignment = NSTextAlignmentRight;
    _createTime.textColor = [UIColor GPTextTheTimeColor];
    
    _comment.text = @"";
    _comment.font = [UIFont systemFontOfSize:14];
    _comment.textColor = [UIColor GPTextThePaperColor];
    _comment.numberOfLines = 0;
//    _comment.backgroundColor = [UIColor greenColor];
}

-(void)refreshUIWithCommentModel:(CommentModel *)model {
    CGFloat heigh = [GPNSdate getStringHeightWithText:model.comment font:[UIFont systemFontOfSize:14] viewWidth:screenWidth-40];
    [_comment mas_updateConstraints:^(MASConstraintMaker *make) {
         make.height.mas_equalTo(heigh);
    }];
    
    [_hearImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",gp_address,model.headPicUrl]]];
    _nickname.text = model.nickname;
    _createTime.text = model.createTime;
    _comment.attributedText = [UILabel setLabelIndent:21 text:model.comment andLabel:_comment];
}

@end
