//
//  AppDelegate.h
//  PMSC
//
//  Created by 李锐 on 16/8/20.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTabBarViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,retain)BaseTabBarViewController *tabBarVC;

@end

