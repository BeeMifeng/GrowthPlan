//
//  HomeArticle.m
//  GrowthPlan
//
//  Created by lijialun on 2019/4/3.
//  Copyright © 2019年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "HomeArticle.h"

@implementation HomeArticle
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"Articelid":@"id",
             @"Comments":@"navigationArticleCommentViewList"
             };
}

// 声明自定义类参数类型
+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value使用[YYEatModel class]或YYEatModel.class或@"YYEatModel"没有区别
    return @{@"Comments" : [CommentModel class]};
}
@end
