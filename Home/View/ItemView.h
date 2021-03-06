//
//  ItemView.h
//  GrowthPlan
//
//  Created by 王政 on 2018/12/27.
//  Copyright © 2018年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ItemView : UIView
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UILabel *label;

- (instancetype)initWithImageName:(NSString*)imageName andTitle:(NSString*)title;
@end

NS_ASSUME_NONNULL_END
