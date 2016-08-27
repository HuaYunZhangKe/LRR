//
//  XLTabItem.h
//  XLTabController
//
//  Created by 杨晓龙 on 16/8/22.
//  Copyright © 2016年 杨晓龙. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  Badge样式
 */
typedef NS_ENUM(NSInteger,XLTabItemBadgeStyle) {
    XLTabItemBadgeStyleNumber = 0, // 数字样式
    XLTabItemBadgeStyleDot= 1, // 小圆点
};

@interface XLTabItem : UIButton
/**
 *  item在tabBar中的index，此属性不能手动设置
 */
@property (nonatomic, assign) NSInteger index;

/**
 *  用于记录tabItem在缩放前的frame，
 *  在XLTabBar的属性itemFontChangeFollowContentScroll == YES时会用到
 */
@property (nonatomic, assign, readonly) CGRect frameWithOutTransform;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIColor *titleSelectedColor;
@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UIImage *selectedImage;

@property (nonatomic, assign) NSInteger badge;
/**
 *  @author YASIN, 16-08-22 15:08:17
 *
 *  bage的样式，支持数字样式和小圆点
 */
@property (nonatomic, assign) XLTabItemBadgeStyle badgeStyle;

@property (nonatomic, strong) UIColor *badgeBackgroundColor;

@property (nonatomic, strong) UIImage *badgeBackgroundImage;
/**
 *  @author YASIN, 16-08-22 15:08:45
 *
 *  badge的标题颜色
 */
@property (nonatomic, strong) UIColor *badgeTitleColor;
/**
 *  @author YASIN, 16-08-22 15:08:17
 *
 *  badge的标题字体，默认13号
 */
@property (nonatomic, strong) UIFont *badgeTitleFont;
/**
 *  @author YASIN, 16-08-22 15:08:50
 *
 *  设置Image和Title水平居中
 */
@property (nonatomic, assign, getter=isContentHorizontalCenter) BOOL contentHorizontalCenter;
/**
 *  @author YASIN, 16-08-22 15:08:02
 *
 *  设置Image和Title水平呢居中
 *
 *  @param verticalOffset   竖直方向的偏移量
 *  @param spacing          Image与Title的间距
 */
- (void)setContentHorizontalCenterWithVerticalOffset:(CGFloat)verticalOffset spacing:(CGFloat)spacing;

- (void)setDoubleTapHandler:(void (^)(void))handler;

- (void)setNumberBadgeMarginTop:(CGFloat)marginTop
              centerMarginRight:(CGFloat)centerMarginRight
            titleHorizonalSpace:(CGFloat)titleHorizonalSpace
             titleVerticalSpace:(CGFloat)titleVerticalSpace;

- (void)setDotBadgeMarginTop:(CGFloat)marginTop
           centerMarginRight:(CGFloat)centerMarginRight
                  sideLength:(CGFloat)sideLength;

@end
