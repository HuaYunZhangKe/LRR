//
//  XLHttpManager.m
//  yasin
//
//  Created by 杨晓龙 on 16/7/4.
//  Copyright © 2016年 杨晓龙. All rights reserved.
//

#import "XLHttpManager.h"
#import <AFNetworking.h>
#import "SignalR.h"
#define xl_completeURL(base, component) [NSString stringWithFormat:@"%@%@.plist",(base),(component)]


/**
 *  获取类的名字变作字符串
 */

#define xl_GetClass_Name(vc)      [NSString stringWithUTF8String:object_getClassName(vc)]

#define xl_Error_Network              @"网络不给力"

@interface XLHttpManager (){
    
    NSInteger reachabilityStatus;
    
    AFHTTPSessionManager *httpManager;
    
    NSTimeInterval timeoutInterval1;
    
}

@property (nonatomic, strong) MBProgressHUD *hud;
@end

@implementation XLHttpManager
+ (instancetype)currentManager {
    
    return [self sharedHttpManager];
    
}
- (MBProgressHUD *)hud
{
    if (!_hud) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
       self.hud = [[MBProgressHUD alloc] initWithWindow:window];
    }
    return _hud;
}
+ (instancetype)sharedHttpManager {
    
    static id instance;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        instance = [[[self class] alloc] init];
        
    });
    
    return instance;
    
}

- (instancetype)init
{
    
    httpManager = [AFHTTPSessionManager manager];
    
    httpManager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    httpManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",@"text/plain",@"text/xml", nil];
    NSLog(@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"cookie"]);
    

    timeoutInterval1 = 86400;
    
    return self;
    
}

- (void)httpManagerXLNetworkReachabilityManage {
    
    [xl_ReachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        reachabilityStatus = status;
        NSLog(@"%ld",reachabilityStatus);
        switch (status) {
                
            case AFNetworkReachabilityStatusNotReachable: {
                
                NSLog(@"无网络");
                
                break;
                
            }
                
            case AFNetworkReachabilityStatusReachableViaWiFi:{
                
                NSLog(@"WiFi网络");
                
                break;
                
            }
                
            case AFNetworkReachabilityStatusReachableViaWWAN: {
                
                NSLog(@"无线网络");
                
                break;
                
            }
                
            default:
                
                NSLog(@"不明网络");
                
                break;
                
        }
        
    }];
    [xl_ReachabilityManager startMonitoring];
}

/**
 *  POST
 *
 *  @param param          入参
 *  @param urlStr         请求地址
 *  @param isCache          是否缓存
 *  @param viewController 当前的vc
 *  @param success        成功返回值
 *  @param fail           失败返回值
 */

- (void)httpManagerPostParameter:(NSDictionary *)param toHttpUrlStr:(NSString *)urlStr isCacheorNot:(BOOL)isCache  targetViewController:(UIViewController *)viewController andUrlFunctionName:(NSString *)urlName success:(void(^)(id responseObject))success orFail:(void(^)(NSError *error))fail {
    
    switch (reachabilityStatus) {
            
        case 0: {
            
            if (![xl_CurrentFileManager objectForKey:xl_completeURL(xl_GetClass_Name(viewController), urlName)]) {
                
                NSError *er = [[NSError alloc] initWithDomain:@"暂无缓存可用" code:10001 userInfo:nil];
                
                fail(er);
                
                return;
                
            }
            
//            NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:(NSData *)[xl_CurrentFileManager objectForKey:xl_completeURL(xl_GetClass_Name(viewController), urlName)] options:NSJSONReadingMutableLeaves|NSJSONReadingMutableContainers error:nil];
            NSDictionary *jsonDic = (NSDictionary *)[xl_CurrentFileManager objectForKey:xl_completeURL(xl_GetClass_Name(viewController), urlName)];
            success(jsonDic);
        }
            break;
            
        default: {
            
            
           self.hud.dimBackground = NO;
            UIWindow *window = [UIApplication sharedApplication].keyWindow;
            //    hud.backgroundColor = [UIColor greenColor];
            _hud.mode = MBProgressHUDModeCustomView;
            NSMutableArray *array  = [NSMutableArray array];
            for (int i = 0; i < 8; i++) {
                UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i + 1]];
                [array addObject:image];
            }
            
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"加载%d.jpg",1]]];
            imageView.animationImages = array;
            [imageView setAnimationDuration:1.5];
            [imageView setAnimationRepeatCount:0];
            [imageView startAnimating];
            imageView.size = CGSizeMake(268 * kScreenWidth, 268 * kScreenWidth);
            _hud.customView = imageView;
            //    hud.margin = 0;
            _hud.minSize = CGSizeMake(50, 50);
            
            _hud.opacity = 0;
            [window addSubview:_hud];
            [_hud show:YES];

            [httpManager POST:urlStr parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [_hud hide:YES];
                NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
                NSDictionary *allHeader = response.allHeaderFields;
                
                NSLog(@"%@",[allHeader objectForKey:@"Set-Cookie"]);

                NSString *string = [allHeader objectForKey:@"Set-Cookie"];
                NSLog(@"%@",string);
                if (string.length != 0) {
                    
                    [[NSUserDefaults standardUserDefaults] setObject:string forKey:@"cookie"];
                    [[NSUserDefaults standardUserDefaults] synchronize];
                    
                }
                [httpManager.requestSerializer setValue:[[NSUserDefaults standardUserDefaults] objectForKey:@"cookie"] forHTTPHeaderField:@"Cookie"];
                
                if ([NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"cookie"]].length != 0) {
                    [[Address shareConnection] didClose];
//                    NSDictionary *dic = @{@"AuthenticationTicket":[[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"cookie"]] substringFromIndex:21]};
//                    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:dic];
                    
                    [[Address shareConnection] addValue:[[NSUserDefaults standardUserDefaults] objectForKey:@"cookie"] forHTTPHeaderField:@"Cookie"];
                    [[Address shareConnection] start];
                }
               
                if (task.state == NSURLSessionTaskStateCompleted) {
                    
                    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves|NSJSONReadingMutableContainers error:nil];
                    
                    if (isCache) {
                        
                        [xl_CurrentFileManager setObject:jsonDic forKey:xl_completeURL(xl_GetClass_Name(viewController), urlName) withTimeoutInterval:timeoutInterval1];
                        
                    }
                    
                    success(jsonDic);
                    
                } else {
                    
                    NSError *error = [[NSError alloc] initWithDomain:xl_Error_Network code:0 userInfo:nil];

                    fail(error);
                    
                }
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [_hud hide:YES];
//                NSData *data1 = [error.userInfo objectForKey:@"com.alamofire.serialization.response.error.data"];
//                NSString *string = [[NSString alloc] initWithData:data1 encoding:NSUTF8StringEncoding];
//                NSLog(@"%@",string);
//                
//                if (string.length != 0) {
//                    NSDictionary *dic = [XLMethod dictionaryWithJsonString:string];
//                    NSLog(@"%@",dic[@"Message"]);
//                    [[NSNotificationCenter defaultCenter] postNotificationName:@"错误提示" object:nil userInfo:@{@"message": [NSString stringWithFormat:@"%@",dic[@"Message"]]}];
//                }else
//                {
//                    [[NSNotificationCenter defaultCenter] postNotificationName:@"错误提示" object:nil userInfo:@{@"message": [NSString stringWithFormat:@"%@",error.userInfo[@"NSLocalizedDescription"]]}];
//                }

                fail(error);
                
            }];
            
        }
            break;
    }
}


- (void)httpManagerGetFromHttpUrlStr:(NSString *)urlStr withParameter:(NSDictionary *)param isCacheorNot:(BOOL)isCache  targetViewController:(UIViewController *)viewController andUrlFunctionName:(NSString *)urlName success:(void(^)(id responseObject))success orFail:(void(^)(NSError *error))fail {
    
    switch (reachabilityStatus) {
            
        case 0: {
            
            if (![xl_CurrentFileManager objectForKey:xl_completeURL(xl_GetClass_Name(viewController), urlName)]) {
                
                NSError *er = [[NSError alloc] initWithDomain:@"暂无缓存可用" code:10001 userInfo:nil];
                
                fail(er);
                
                return;
                
            }
            NSLog(@"%@",[xl_CurrentFileManager objectForKey:xl_completeURL(xl_GetClass_Name(viewController), urlName)]);
//            NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:(NSData *)[xl_CurrentFileManager objectForKey:xl_completeURL(xl_GetClass_Name(viewController), urlName)] options:NSJSONReadingMutableLeaves|NSJSONReadingMutableContainers error:nil];
            NSDictionary *jsonDic = (NSDictionary *)[xl_CurrentFileManager objectForKey:xl_completeURL(xl_GetClass_Name(viewController), urlName)];
            success(jsonDic);
            
        }
            break;
            
        default: {
            UIWindow *window = [UIApplication sharedApplication].keyWindow;
            
            
            self.hud.dimBackground = NO;
            
            //    hud.backgroundColor = [UIColor greenColor];
            _hud.mode = MBProgressHUDModeCustomView;
            NSMutableArray *array  = [NSMutableArray array];
            for (int i = 0; i < 8; i++) {
                UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i + 1]];
                [array addObject:image];
            }
            
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"加载%d.jpg",1]]];
            imageView.animationImages = array;
            [imageView setAnimationDuration:1.5];
            [imageView setAnimationRepeatCount:0];
            [imageView startAnimating];
            imageView.size = CGSizeMake(268 * kScreenWidth, 268 * kScreenWidth);
            _hud.customView = imageView;
            //    hud.margin = 0;
            _hud.minSize = CGSizeMake(50, 50);
            
            _hud.opacity = 0;
            [window addSubview:_hud];
            [_hud show:YES];
            [httpManager GET:urlStr parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [_hud hide:YES];
                NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
                NSDictionary *allHeader = response.allHeaderFields;
                
                                NSString *string = [allHeader objectForKey:@"Set-Cookie"];
                NSLog(@"%@",string);
                
                NSLog(@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"cookie"]);
                NSLog(@"%@",[[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"cookie"]] substringFromIndex:21]);
                if (string.length != 0) {
                   
                    [[NSUserDefaults standardUserDefaults] setObject:string forKey:@"cookie"];
                    [[NSUserDefaults standardUserDefaults] synchronize];
                    
                }
                
                [httpManager.requestSerializer setValue:[[NSUserDefaults standardUserDefaults] objectForKey:@"cookie"] forHTTPHeaderField:@"Cookie"];
                if ([NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"cookie"]].length != 0) {
                    [[Address shareConnection] didClose];
                    NSDictionary *dic = @{@"AuthenticationTicket":[[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"cookie"]] substringFromIndex:21]};
                    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:dic];
                    
                    [[Address shareConnection] setHeaders:dict];
                    [[Address shareConnection] start];
                }

                
                if (task.state == NSURLSessionTaskStateCompleted) {
                    
                    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves|NSJSONReadingMutableContainers error:nil];
                    
                    if (isCache) {
                        
                        [xl_CurrentFileManager setObject:jsonDic forKey:xl_completeURL(xl_GetClass_Name(viewController), urlName) withTimeoutInterval:timeoutInterval1];
                        
                    }
                    
                    success(jsonDic);
                    
                } else {
                    
                    NSError *error = [[NSError alloc] initWithDomain:xl_Error_Network code:0 userInfo:nil];
                   
                    fail(error);
                    
                }
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error.userInfo[@"NSLocalizedDescription"]);
                [_hud hide: YES];
//                NSData *data1 = [error.userInfo objectForKey:@"com.alamofire.serialization.response.error.data"];
//                NSString *string = [[NSString alloc] initWithData:data1 encoding:NSUTF8StringEncoding];
//                NSLog(@"%@",string);
//               
//                if (string.length != 0) {
//                    NSDictionary *dic = [XLMethod dictionaryWithJsonString:string];
//                    NSLog(@"%@",dic[@"Message"]);
//                     [[NSNotificationCenter defaultCenter] postNotificationName:@"错误提示" object:nil userInfo:@{@"message": [NSString stringWithFormat:@"%@",dic[@"Message"]]}];
//                }else
//                {
//                    [[NSNotificationCenter defaultCenter] postNotificationName:@"错误提示" object:nil userInfo:@{@"message": [NSString stringWithFormat:@"%@",error.userInfo[@"NSLocalizedDescription"]]}];
//                }
               
                fail(error);
                
            }];
            
        }
            break;
    }
    
}

@end
