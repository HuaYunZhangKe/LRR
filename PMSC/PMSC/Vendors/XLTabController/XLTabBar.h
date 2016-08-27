//
//  XLTabBar.h
//  XLTabController
//
//  Created by 杨晓龙 on 16/8/22.
//  Copyright © 2016年 杨晓龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLTabItem.h"
@class XLTabBar;
@protocol XLTabBarDelegate <NSObject>

@optional
- (BOOL)xl_tabBar:(XLTabBar *)tabBar willSelectItemAtIndex:(NSInteger)index;
- (void)xl_tabBar:(XLTabBar *)tabBar
didSelectedItemAtIndex:(NSInteger)index;

@end
@interface XLTabBar : UIView<UIScrollViewDelegate>

/**
 *  TabItems，提供给XLTabBarController使用，一般不手动设置此属性
 */
@property (nonatomic, copy) NSArray <XLTabItem *> *items;

@property (nonatomic, strong) UIColor *itemSelectedBgColor;         // item选中背景颜色
@property (nonatomic, strong) UIImage *itemSelectedBgImage;         // item选中背景图像
@property (nonatomic, assign) CGFloat itemSelectedBgCornerRadius;   // item选中背景圆角

@property (nonatomic, strong) UIColor *itemTitleColor;              // 标题颜色
@property (nonatomic, strong) UIColor *itemTitleSelectedColor;      // 选中时标题的颜色
@property (nonatomic, strong) UIFont  *itemTitleFont;               // 标题字体
@property (nonatomic, strong) UIFont  *itemTitleSelectedFont;       // 选中时标题的字体

@property (nonatomic, strong) UIColor *badgeBackgroundColor;        // Badge背景颜色
@property (nonatomic, strong) UIImage *badgeBackgroundImage;        // Badge背景图像
@property (nonatomic, strong) UIColor *badgeTitleColor;             // Badge标题颜色
@property (nonatomic, strong) UIFont  *badgeTitleFont;              // Badge标题字体

@property (nonatomic, assign) CGFloat leftAndRightSpacing;          // TabBar边缘与第一个和最后一个item的距离

@property (nonatomic, assign) NSInteger selectedItemIndex;          // 选中某一个item


/**
 *  拖动内容视图时，item的颜色是否根据拖动位置显示渐变效果，默认为YES
 */
@property (nonatomic, assign, getter = isItemColorChangeFollowContentScroll) BOOL itemColorChangeFollowContentScroll;

/**
 *  拖动内容视图时，item的字体是否根据拖动位置显示渐变效果，默认为NO
 */
@property (nonatomic, assign, getter = isItemFontChangeFollowContentScroll) BOOL itemFontChangeFollowContentScroll;

/**
 *  TabItem的选中背景是否随contentView滑动而移动
 */
@property (nonatomic, assign, getter = isItemSelectedBgScrollFollowContent) BOOL itemSelectedBgScrollFollowContent;


@property (nonatomic, assign, getter = isItemContentHorizontalCenter) BOOL itemContentHorizontalCenter;

@property (nonatomic, weak) id<XLTabBarDelegate> delegate;


- (XLTabItem *)selectedItem;


- (void)setTitles:(NSArray <NSString *> *)titles;


- (void)setItemSelectedBgInsets:(UIEdgeInsets)insets tapSwitchAnimated:(BOOL)animated;


- (void)setScrollEnabledAndItemWidth:(CGFloat)width;


- (void)setScrollEnabledAndItemFitTextWidthWithSpacing:(CGFloat)spacing;


- (void)setItemContentHorizontalCenterWithVerticalOffset:(CGFloat)verticalOffset
                                                 spacing:(CGFloat)spacing;


- (void)setNumberBadgeMarginTop:(CGFloat)marginTop
              centerMarginRight:(CGFloat)centerMarginRight
            titleHorizonalSpace:(CGFloat)titleHorizonalSpace
             titleVerticalSpace:(CGFloat)titleVerticalSpace;

- (void)setDotBadgeMarginTop:(CGFloat)marginTop
           centerMarginRight:(CGFloat)centerMarginRight
                  sideLength:(CGFloat)sideLength;


- (void)setItemSeparatorColor:(UIColor *)itemSeparatorColor
                        width:(CGFloat)width
                    marginTop:(CGFloat)marginTop
                 marginBottom:(CGFloat)marginBottom;

- (void)setItemSeparatorColor:(UIColor *)itemSeparatorColor
                    marginTop:(CGFloat)marginTop
                 marginBottom:(CGFloat)marginBottom;


- (void)setSpecialItem:(XLTabItem *)item
    afterItemWithIndex:(NSInteger)index
            tapHandler:(void (^)(XLTabItem *item))handler;

@end
