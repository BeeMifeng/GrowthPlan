//
//  CommentModel.h
//  GrowthPlan
//
//  Created by lijialun on 2019/4/4.
//  Copyright © 2019年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommentModel : NSObject
@property(nonatomic,copy)NSString *headPicUrl;
@property(nonatomic,copy)NSString *nickname;
@property(nonatomic,copy)NSString *comment;
@property(nonatomic,copy)NSString *createTime;
@end

NS_ASSUME_NONNULL_END
