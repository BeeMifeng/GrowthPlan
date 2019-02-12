//
//  MineViewCell.m
//  GrowthPlan
//
//  Created by 王政 on 2019/1/2.
//  Copyright © 2019年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "MineViewCell.h"
#import "MineViewItem.h"

@interface MineViewCell()
@property(nonatomic,strong)MineViewItem *cellView;
@end



@implementation MineViewCell

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
    
    self.cellView = [[MineViewItem alloc]init];
    [self addSubview:self.cellView];
    
    [self.cellView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
}


-(void)refreshData:(MenuModel *)model {
    [self.cellView setLeftImg:model.menuImgName andRightImg:model.nextImgName andKey:model.menuName andValue:@""];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
