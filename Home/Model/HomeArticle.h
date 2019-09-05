//
//  HomeArticle.h
//  GrowthPlan
//
//  Created by lijialun on 2019/4/3.
//  Copyright © 2019年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <NSObject+YYModel.h>
#import "CommentModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface HomeArticle : NSObject
@property(nonatomic,copy)NSString *Articelid;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *titlePic;
@property(nonatomic,copy)NSString *auther;
@property(nonatomic,copy)NSString *navigationId;
@property(nonatomic,copy)NSString *likeCount;
@property(nonatomic,copy)NSString *commentCount;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *simpleContent;
@property(nonatomic,assign)BOOL isLike;
@property(nonatomic,copy)NSString *createTime;
@property(nonatomic,copy)NSString *updateTime;

@property(nonatomic,strong)NSArray<CommentModel*>*Comments;
@end

NS_ASSUME_NONNULL_END
