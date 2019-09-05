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

+(BOOL)infoForm:(NSString *)ownerNickname ownerRelation:(NSString *)ownerRelation ownerBirthday:(NSString *)ownerbirthday ownerCity:(NSString *)ownerCity passWord:(NSString *)passWord babyNickName:(NSString *)babyNickName babySex:(NSString *)babySex babyBirthday:(NSString *)babyBorthday babyGrade:(NSString *)babyGrade babyDream:(NSString *)babyDream {
    if ([ownerNickname isEqualToString:@""]) {
        [SVProgressHUD showInfoWithStatus:@"昵称不能为空"];
        [SVProgressHUD dismissWithDelay:1.0];
        return NO;
    }
    
    if ([ownerRelation isEqualToString:@"请选择您的身份"]) {
        [SVProgressHUD showInfoWithStatus:@"请选择您的身份"];
        [SVProgressHUD dismissWithDelay:1.0];
        return NO;
    }
    
    if ([ownerbirthday isEqualToString:@"请选择您的生日"]) {
        [SVProgressHUD showInfoWithStatus:@"请选择您的生日"];
        [SVProgressHUD dismissWithDelay:1.0];
        return NO;
    }
    
    if ([ownerCity isEqualToString:@"请选择您的城市"]) {
        [SVProgressHUD showInfoWithStatus:@"请选择您的城市"];
        [SVProgressHUD dismissWithDelay:1.0];
        return NO;
    }
    
    if (![Verify checkPassword:passWord]) {
        
        return NO;
    }
    
    if ([babyNickName isEqualToString:@""]) {
        [SVProgressHUD showInfoWithStatus:@"宝贝昵称不能为空"];
        [SVProgressHUD dismissWithDelay:1.0];
        return NO;
    }
    
    if ([babySex isEqualToString:@"请选择您宝贝的性别"]) {
        [SVProgressHUD showInfoWithStatus:@"请选择您宝贝的性别"];
        [SVProgressHUD dismissWithDelay:1.0];
        return NO;
    }
    
    if ([babyBorthday isEqualToString:@"请选择您宝贝的生日"]) {
        [SVProgressHUD showInfoWithStatus:@"请选择您宝贝的生日"];
        [SVProgressHUD dismissWithDelay:1.0];
        return NO;
    }
    
    if ([babyGrade isEqualToString:@"请选择您宝贝的年级"]) {
        [SVProgressHUD showInfoWithStatus:@"请选择您宝贝的年级"];
        [SVProgressHUD dismissWithDelay:1.0];
        return NO;
    }
    
    if ([babyDream isEqualToString:@""]) {
        [SVProgressHUD showInfoWithStatus:@"宝贝的梦想不能为空哦"];
        [SVProgressHUD dismissWithDelay:1.0];
        return NO;
    }
    
    return YES;
}

@end
