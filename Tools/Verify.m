//
//  Verify.m
//  TaiHeBoom
//
//  Created by 王政 on 2018/7/5.
//  Copyright © 2018年 TaiHe. All rights reserved.
//

#import "Verify.h"
#import "SVProgressHUD.h"
@interface Verify ()

@end


@implementation Verify


+(BOOL)checkPhoneNum:(NSString *)phoneNum {
    
    NSString *regular = @"^1[3|4|5|6|7|8|9][0-9]{9}$";
    NSPredicate *phone = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regular];
    
    if (![phone evaluateWithObject:phoneNum] || phoneNum.length > 11) {
        [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
        [SVProgressHUD showInfoWithStatus:@"请输入正确的手机号码"];
        [SVProgressHUD dismissWithDelay:1.0];
        
        return NO;
    }
    return YES;
}


+(BOOL)checkCodeNum:(NSString *)codeNum {
    if (codeNum.length == 0) {
        [SVProgressHUD showInfoWithStatus:@"验证码不能为空"];
        [SVProgressHUD dismissWithDelay:1.0];
        return NO;
    }
    return YES;
}

+(BOOL)checkPassword:(NSString*)password {
    if([password containsString:@"&"]){
        [SVProgressHUD showInfoWithStatus:@"密码含非法字符"];
        [SVProgressHUD dismissWithDelay:1.0];
        return NO;
    }
    if (password.length == 0) {
        [SVProgressHUD showInfoWithStatus:@"密码不能为空"];
        [SVProgressHUD dismissWithDelay:1.0];
        return NO;
    } else if (password.length < 6) {
        [SVProgressHUD showInfoWithStatus:@"密码过于简单"];
        [SVProgressHUD dismissWithDelay:1.0];
        return NO;
    }else if(password.length > 16)
    {
        [SVProgressHUD showInfoWithStatus:@"密码超出16位字符"];
        [SVProgressHUD dismissWithDelay:1.0];
        return NO;
    }
    return YES;
}
@end
