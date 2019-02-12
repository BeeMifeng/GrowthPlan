//
//  ItemViewCell.h
//  GrowthPlan
//
//  Created by 王政 on 2018/12/28.
//  Copyright © 2018年 lijialun.develop.GrowthPlan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ItemViewCellDelegate <NSObject>

-(void)didselectedItemOnIndex:(NSInteger)index;

@end


@interface ItemViewCell : UITableViewCell
@property(nonatomic,weak)id <ItemViewCellDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
