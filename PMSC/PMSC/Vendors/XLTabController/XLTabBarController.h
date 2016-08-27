//
//  XLTabBarController.h
//  XLTabController
//
//  Created by 杨晓龙 on 16/8/22.
//  Copyright © 2016年 杨晓龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLTabItem.h"
#import "XLTabBar.h"
@interface XLTabBarController : UIViewController<XLTabBarDelegate>
@property (nonatomic, strong, readonly) XLTabBar *tabBar;

@property (nonatomic, copy) NSArray <UIViewController *> *viewControllers;


@property (nonatomic, assign) CGRect contentViewFrame;


@property (nonatomic, assign, readonly) NSInteger selectedControllerIndex;


- (void)setTabBarFrame:(CGRect)tabBarFrame contentViewFrame:(CGRect)contentViewFrame;



- (void)setContentScrollEnabledAndTapSwitchAnimated:(BOOL)animated;


- (UIViewController *)selectedController;

@end

@interface UIViewController (XLTabBarController)

@property (nonatomic, copy) NSString *XL_tabItemTitle; // tabItem的标题
@property (nonatomic, strong) UIImage *XL_tabItemImage; // tabItem的图像
@property (nonatomic, strong) UIImage *XL_tabItemSelectedImage; // tabItem的选中图像

- (XLTabItem *)XL_tabItem;
- (XLTabBarController *)XL_tabBarController;


- (void)tabItemDidSelected;

- (void)tabItemDidDeselected;


@end
