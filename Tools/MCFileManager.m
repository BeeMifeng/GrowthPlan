//
//  MCFileManager.m
//  FileOperationDemo
//
//  Created by Realank on 16/5/21.
//  Copyright © 2016年 iMooc. All rights reserved.
//

#import "MCFileManager.h"

@implementation MCFileManager


//获取沙盒根目录
+(NSString*)homeDirectory{
    return NSHomeDirectory();
}

//获取Documents目录
+(NSString*)documentsDirectory{
    NSString* documentsDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    return documentsDir;
}

//获取Library目录
+(NSString*)libraryDirectory{
    NSString* libraryDir = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
    return libraryDir;
}

//获取Cache目录
+(NSString*)cacheDirectory{
    NSString* cacheDir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    return cacheDir;
}

//获取tmp目录
+(NSString*)tmpDirectory{
    return NSTemporaryDirectory();
}


/**
 *  写入字典到文件
 */
+(BOOL)saveDictionary:(NSDictionary*)dic isPlistFileOfPath:(NSString*)path{
    //判断dict是否是有效的字典
    if (dic && [dic isKindOfClass:[NSDictionary class]]) {
        return [[MCFileManager simpDicFromDic:dic] writeToFile:path atomically:YES];
    }
    return NO;
}

/**
 *  从Plist文件中读取字典
 */
+(NSDictionary*)dictionaryInPlistFileOfPath:(NSString*)path{
    //判断文件是否存在
    if ([self fileExistInPath:path isDirectory:nil]) {
        //文件存在
        //读取文件
        NSDictionary* dict = [[NSDictionary alloc] initWithContentsOfFile:path];
        //判断读取到的dict实例是否有效
        if (dict && [dict isKindOfClass:[NSDictionary class]]) {
            return dict;
        }
    }
    return nil;
}

//删除某个文件
+(BOOL)removeAllFromFilePath:(NSString*)path {
    NSError *error = nil;
    [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
    if (error) {
        return NO;
    }
    return YES;
}

//去null
+(NSDictionary*)simpDicFromDic:(NSDictionary*)dic {
    NSMutableDictionary *muDic = [dic mutableCopy];
    for (NSString *key in [dic allKeys]) {
        if ([dic[key] isKindOfClass:[NSDictionary class]]) {
           muDic[key] =  [self simpDicFromDic:dic[key]];
        }else
        {
            if ([dic[key] isEqual:[NSNull null]]) {
                muDic[key] = @"";
            }
        }
    }
    return muDic;
}

@end








