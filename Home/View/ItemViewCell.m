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
@property(nonatomic,strong)NSArray<NavItemModel *> *titleArr;

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
       
    }
    return self;
}

-(void)setup {
    self.marggingLeft = (screenWidth - 62*4) / 5;
    for (NSInteger i = 0;i < self.titleArr.count ; i ++) {
        ItemView *item = [[ItemView alloc]initWithImageName:self.titleArr[i].name andTitle:self.titleArr[i].iconUrl];
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
        [item mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(9 + 100*((i-10)/4));
            make.left.mas_equalTo(self.marggingLeft + ((screenWidth - self.marggingLeft * 2 - 62*4)/3+62) * ((i-10)%4));
            make.width.mas_equalTo(62);
            make.height.mas_equalTo(82);
        }];
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
    self.titleArr = modelArr;
    [self setup];
    for (NSInteger i = 0; i < modelArr.count; i ++) {
        ItemView *item = [self viewWithTag:(10+i)];
        NavItemModel *model = modelArr[i];
        [item.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",gp_address,model.iconUrl]]];
        item.label.text = model.name;
    }
}

@end
