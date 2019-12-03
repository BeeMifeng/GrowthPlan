//
//  BillModel.h
//  GrowthPlan
//
//  Created by 李嘉伦 on 2019/12/3.
//  Copyright © 2019 lijialun.develop.GrowthPlan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <NSObject+YYModel.h>
NS_ASSUME_NONNULL_BEGIN

@interface BillModel : NSObject
@property(nonatomic,copy)NSString *createTime;
@property(nonatomic,copy)NSString *billId;
@property(nonatomic,copy)NSString *orderNo;
@property(nonatomic,copy)NSString *outOrderNo;
@property(nonatomic,copy)NSString *paymentAmount;
@property(nonatomic,copy)NSString *paymentType;
@property(nonatomic,copy)NSString *status;
@property(nonatomic,copy)NSString *time;
@property(nonatomic,copy)NSString *totalAmount;
@property(nonatomic,copy)NSString *userId;
@end

NS_ASSUME_NONNULL_END
