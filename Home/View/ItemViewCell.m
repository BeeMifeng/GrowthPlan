//
//  ItemViewCell.m
//  GrowthPlan
//
//  Created by 王政 on 2018/12/28.
//  Copyright © 2018年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "ItemViewCell.h"
#import "ItemView.h"
#import "Masonry.h"
#import "UIColor+Hex.h"
#import "UIImageView+WebCache.h"
@interface ItemViewCell()
@property(nonatomic,strong)NSArray *titleArr;
@property(nonatomic,strong)NSArray *imgArr;

//距离屏幕的边距
@property(nonatomic,assign)CGFloat marggingLeft;
@end

@implementation ItemViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup {
    self.marggingLeft = (screenWidth - 62*4) / 5;
    
    self.imgArr = @[@"",@"",@"",@""];
    
    self.titleArr = @[@"",@"",@"",@""];
    
    for (NSInteger i = 0;i < self.titleArr.count ; i ++) {
        ItemView *item = [[ItemView alloc]initWithImageName:self.imgArr[i] andTitle:self.titleArr[i]];
        item.tag = 10 + i;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchAction:)];
        
        [item addGestureRecognizer:tap];
        
        [self addSubview:item];
        [self GPlayout];
    }
    
}

-(void)GPlayout {
    
for (NSInteger i = 10; i < 10 + self.titleArr.count; i++) {
    ItemView *item = [self viewWithTag:i];
    
    if (i == 10) {
        [item mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(9);
            make.left.mas_equalTo(self.marggingLeft);
            make.width.mas_equalTo(62);
            make.height.mas_equalTo(82);
        }];
    }else
    {
        [item mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(9);
            make.left.mas_equalTo([self viewWithTag:(i-1)].mas_right).offset((screenWidth - self.marggingLeft * 2 - 62*4)/3);
            make.width.mas_equalTo(62);
            make.height.mas_equalTo(82);
        }];
    }
}
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


}


-(void)touchAction:(UITapGestureRecognizer*)tap {
    if (_delegate && [_delegate respondsToSelector:@selector(didselectedItemOnIndex:)]) {
        [_delegate didselectedItemOnIndex:tap.view.tag - 10];
    }
}

-(void)refreshUIWithModel:(NSArray *)modelArr {
    for (NSInteger i = 0; i < modelArr.count; i ++) {
        ItemView *item = [self viewWithTag:(10+i)];
        NavItemModel *model = modelArr[i];
        [item.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",gp_address,model.iconUrl]]];
        item.label.text = model.name;
    }
}

@end
