//
//  ListViewCell.m
//  GrowthPlan
//
//  Created by 王政 on 2018/12/28.
//  Copyright © 2018年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "ListViewCell.h"
#import "Masonry.h"
#import "UIColor+Hex.h"
#import "UILabel+ChangeLineSpaceAndWordSpace.h"
@interface ListViewCell()
@property(nonatomic,strong)UIImageView *listImageView;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *timeLabel;
@property(nonatomic,strong)UILabel *ThePaper;
@end


@implementation ListViewCell

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
    
    self.listImageView = [[UIImageView alloc]init];
    self.titleLabel = [[UILabel alloc]init];
    self.timeLabel = [[UILabel alloc]init];
    self.ThePaper = [[UILabel alloc]init];
    
    [self addSubview:self.listImageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.timeLabel];
    [self addSubview:self.ThePaper];
    
    
    //布局
    [self.listImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(19);
        make.left.mas_equalTo((screenWidth - 62*4) / 5);
        make.width.mas_equalTo(62);
        make.height.mas_equalTo(62);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(19);
        make.left.mas_equalTo(self.listImageView.mas_right).offset(13);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(21);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(19);
        make.right.mas_equalTo(-(screenWidth - 62*4) / 5);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(17);
    }];
    
    [self.ThePaper mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(7);
        make.left.mas_equalTo(self.listImageView.mas_right).offset(13);
        make.right.mas_equalTo(-(screenWidth - 62*4) / 5);
        make.height.mas_equalTo(36);
    }];
    
    self.listImageView.image = [UIImage imageNamed:@"placeImg"];
    self.listImageView.layer.cornerRadius = 8;
    self.listImageView.clipsToBounds = YES;
    
    self.titleLabel.text = @"数学那些事";
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    
    self.timeLabel.text = @"2018-12-28";
    self.timeLabel.font = [UIFont systemFontOfSize:12];
    self.timeLabel.textAlignment = NSTextAlignmentRight;
    self.timeLabel.textColor = [UIColor GPTextTitleColor];
    
    self.ThePaper.text = @"语雀是一款优雅高效的在线文档编辑与协同工具， 让每个企业轻松拥有文档中心";
    self.ThePaper.font = [UIFont systemFontOfSize:13];
    self.ThePaper.textColor = [UIColor GPTextThePaperColor];
    self.ThePaper.numberOfLines = 2;
    [UILabel changeSpaceForLabel:self.ThePaper withLineSpace:2.0 WordSpace:1.0];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
