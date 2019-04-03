//
//  ItemView.m
//  GrowthPlan
//
//  Created by 王政 on 2018/12/27.
//  Copyright © 2018年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "ItemView.h"
#import "Masonry.h"
#import "UIColor+Hex.h"

@interface ItemView()
@end

@implementation ItemView
- (instancetype)initWithImageName:(NSString*)imageName andTitle:(NSString*)title
{
    self = [super init];
    if (self) {
        _imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
        _label = [[UILabel alloc]init];
        _label.text = title;
        [self addSubview:_imageView];
        [self addSubview:_label];
        [self GPlayout];
    }
    return self;
}


-(void)GPlayout {
        
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(self.mas_width);
        
    }];
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imageView.mas_bottom);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    self.label.textColor = [UIColor GPTextTitleColor];
    self.label.adjustsFontSizeToFitWidth = YES;
    self.label.textAlignment = NSTextAlignmentCenter;
}
@end
