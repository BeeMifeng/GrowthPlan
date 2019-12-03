//
//  GPNSdate.m
//  GrowthPlan
//
//  Created by 李嘉伦 on 2019/12/2.
//  Copyright © 2019 lijialun.develop.GrowthPlan. All rights reserved.
//

#import "GPNSdate.h"

@implementation GPNSdate
+(NSString*)getCurretYear {
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy"];
    return [dateformatter stringFromDate:senddate];
}
@end
