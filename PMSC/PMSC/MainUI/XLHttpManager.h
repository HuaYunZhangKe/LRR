//
//  XLHttpManager.h
//  yasin
//
//  Created by 杨晓龙 on 16/7/4.
//  Copyright © 2016年 杨晓龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "XLFileManager.h"


/**
 *     Reachability单利
 */

#define  xl_ReachabilityManager  [AFNetworkReachabilityManager sharedManager]

#define xl_HttpManager [XLHttpManager currentManager]

@interface XLHttpManager : NSObject
+ (instancetype)currentManager;

/**
 *  判断网络
 */
- (void)httpManagerXLNetworkReachabilityManage;

/**
 *  POST
 */
- (void)httpManagerPostParameter:(NSDictionary *)param toHttpUrlStr:(NSString *)urlStr isCacheorNot:(BOOL)isCache  targetViewController:(UIViewController *)viewController andUrlFunctionName:(NSString *)urlName success:(void(^)(id responseObject))success orFail:(void(^)(NSError *error))fail;

/**
 *  GET
 */
- (void)httpManagerGetFromHttpUrlStr:(NSString *)urlStr withParameter:(NSDictionary *)param isCacheorNot:(BOOL)isCache  targetViewController:(UIViewController *)viewController andUrlFunctionName:(NSString *)urlName success:(void(^)(id responseObject))success orFail:(void(^)(NSError *error))fail;

@end
