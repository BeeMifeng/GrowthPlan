//
//  MCFileManager.h
//  FileOperationDemo
//
//  Created by Realank on 16/5/21.
//  Copyright © 2016年 iMooc. All rights reserved.
//

#import <Foundation/Foundation.h>

#define PLog(format, ...) [MCFileManager logWithFormat:format, ## __VA_ARGS__]

@interface MCFileManager : NSObject


//获取沙盒根目录
+(NSString*)homeDirectory;
//获取Documents目录
+(NSString*)documentsDirectory;
//获取Library目录
+(NSString*)libraryDirectory;
//获取Cache目录
+(NSString*)cacheDirectory;
//获取tmp目录
+(NSString*)tmpDirectory;

+(BOOL)fileExistInPath:(NSString*)path isDirectory:(BOOL *)isDirectory;
//将字典保存在Plist文件中
+(BOOL)saveDictionary:(NSDictionary*)dict isPlistFileOfPath:(NSString*)path;
//从Plist文件中读取字典
+(NSDictionary*)dictionaryInPlistFileOfPath:(NSString*)path;

+ (void)appendKey:(NSString*)key andValue:(NSString*)value toPath:(NSString*)path;

+ (void)appendDic:(NSDictionary*)dic toPath:(NSString*)path;

+ (NSString*)valueForKey:(NSString*)key fromPath:(NSString*)path;

+(BOOL)removeAllFromFilePath:(NSString*)path;

+(NSDictionary*)simpDicFromDic:(NSDictionary*)dic;
@end





