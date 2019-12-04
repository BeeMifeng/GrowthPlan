//
//  CommentView.h
//  GrowthPlan
//
//  Created by 李嘉伦 on 2019/12/4.
//  Copyright © 2019 lijialun.develop.GrowthPlan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface CommentView : UIView
-(void)refreshUIWithCommentModel:(CommentModel*)model;
@end

NS_ASSUME_NONNULL_END
