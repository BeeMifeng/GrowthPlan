//
//  Verify.h
//  TaiHeBoom
//
//  Created by 王政 on 2018/7/5.
//  Copyright © 2018年 TaiHe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Verify : NSObject

//验证手机号
+(BOOL)checkPhoneNum:(NSString*)phoneNum;

//验证验证码
+(BOOL)checkCodeNum:(NSString*)codeNum;

//验证密码
+(BOOL)checkPassword:(NSString*)password;

@end
