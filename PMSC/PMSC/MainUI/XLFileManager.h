//
//  XLFileManager.h
//  yasin
//
//  Created by 杨晓龙 on 16/7/4.
//  Copyright © 2016年 杨晓龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#if DEBUG
#	define CHECK_FOR_XLCACHE_PLIST() if([key isEqualToString:@"XLCache.plist"]) { \
NSLog(@"XLCache.plist is a reserved key and can not be modified."); \
return; }
#else
#	define CHECK_FOR_XLCACHE_PLIST() if([key isEqualToString:@"XLCache.plist"]) return;
#endif

#define xl_CurrentFileManager [XLFileManager currentCache]


typedef NS_ENUM(NSUInteger, SandBoxPath) {
    
    Library_Caches,
    
    Documents,
    
};


@interface XLFileManager : NSObject
@property(nonatomic) NSTimeInterval defaultTimeoutInterval; // Default is 1 day


+ (BOOL)createCacheDirWithFileName:(NSString *)fileName andSandBoxPath:(SandBoxPath)sbPath;/* 创建目录 */

+ (BOOL)createFile:(NSString *)path withFileName:(NSString *)fileName;/* 创建文件 */



+ (instancetype)currentCache;/* 当前的单利实力对象 */

- (instancetype)initWithCacheDirectory:(NSString*)cacheDirectory;/* 自定义目录创建 */
/**
 *  清除缓存
 */
- (void)clearCache;
- (long)fileSizeAtPath;



- (id<NSCoding>)objectForKey:(NSString*)key;

- (void)setObject:(id<NSCoding>)anObject forKey:(NSString*)key;

- (void)setObject:(id<NSCoding>)anObject forKey:(NSString*)key withTimeoutInterval:(NSTimeInterval)timeoutInterval;


@end
