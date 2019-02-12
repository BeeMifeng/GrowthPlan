//
//  GPSearchView.m
//  GrowthPlan
//
//  Created by 王政 on 2018/12/27.
//  Copyright © 2018年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "GPSearchView.h"
#import "Masonry.h"


@interface GPSearchView()
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UITextField *textField;
@end

@implementation GPSearchView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _imageView = [[UIImageView alloc]init];
        _textField = [[UITextField alloc]init];
        [self addSubview:_imageView];
        [self addSubview:_textField];
        [self GPlayout];
    }
    return self;
}


-(void)GPlayout {
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(8);
        make.left.mas_equalTo(15);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(20);
    }];
    
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(self.imageView.mas_right).offset(10);
        make.bottom.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
    
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 18;
    self.layer.shadowColor = [UIColor GPTextTitleColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(1, 1);//偏移距离
    self.layer.shadowOpacity = 0.5;//不透明度
    self.layer.shadowRadius = 3.0;//半径
    
    self.imageView.image = [UIImage imageNamed:@"search"];
    
    self.textField.borderStyle = UITextBorderStyleNone;
    self.textField.placeholder = @"搜索";
}

@end
