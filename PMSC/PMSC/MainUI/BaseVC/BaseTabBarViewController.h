//
//  BaseTabBarViewController.h
//  PMSC
//
//  Created by 李锐 on 16/8/23.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "XLTabBarController.h"
#import "SaimaViewController.h"
#import "FindViewController.h"
#import "ShopViewController.h"
#import "MyViewController.h"
#import "BaseNaviViewController.h"
@interface BaseTabBarViewController : UITabBarController
@property(nonatomic,retain)BaseNaviViewController *saiMaVC;
@property(nonatomic,retain)BaseNaviViewController *findVC;
@property(nonatomic,retain)BaseNaviViewController *shopVC;
@property(nonatomic,retain)BaseNaviViewController *myVC;
@end
