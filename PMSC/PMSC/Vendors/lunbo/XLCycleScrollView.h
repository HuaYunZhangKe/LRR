//
//  XLCycleScrollView.h
//  lunbo
//
//  Created by 杨晓龙 on 16/5/12.
//  Copyright © 2016年 杨晓龙. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    XLCyclesScrollViewPageContolAlimentRight,
    XLCyclesScrollViewPageContolAlimentCenter
} XLCyclesScrollViewPageContolAliment;

typedef enum {
    XLCycleScrollViewPageContolStyleClassic, // 系统自带经典样式
    XLCycleScrollViewPageContolStyleAnimated, // 动画效果pagecontrol
    XLCycleScrollViewPageContolStyleNone    // 不显示pagecontrol
}XLCycleScrollViewPageContolStyle;

@class XLCycleScrollView;

@protocol XLCycleScrollViewDelegate <NSObject>

@optional
/** 点击图片回调 */
- (void)cycleScrollView:(XLCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index;
/** 图片滚动回调 */
- (void)cycleScrollView:(XLCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index;
@end

@interface XLCycleScrollView : UIView
/** 初始化轮播图（推荐使用） */
+ (instancetype)cycleScrollViewWithFrame:(CGRect)frame delegate:(id<XLCycleScrollViewDelegate>)delegate placeholderImage:(UIImage *)placeholderImage;

+ (instancetype)cycleScrollViewWithFrame:(CGRect)frame imageURLStringsGroup:(NSArray *)imageURLStringsGroup;

/** 本地图片轮播图初始化方式 */
+ (instancetype)cycleScrollViewWithFrame:(CGRect)frame imageNamesGroup:(NSArray *)imageNamesGroup;

/** 本地图片轮播初始化方式2，infiniteLoop:是否无限循环 */
+ (instancetype)cycleScrollVIewWithFrame:(CGRect)frame shouldInfiniteLoop:(BOOL)infiniteLoop imageNamesGroup:(NSArray *)imageNamesGroup;

//////////////////   数据源接口   //////////////////

/** 图片 url string 数组 */
@property (nonatomic, strong) NSArray *imageURLStringsGroup;

/** 每张图片对应显示的文字数组 */
@property (nonatomic, strong) NSArray *titlesGroup;

/** 本地图片数组 */
@property (nonatomic, strong) NSArray *localizationImageNamesGroup;



//////////////////   滚动控制接口   //////////////////

/** 自动滚动间隔，默认2s */
@property (nonatomic, assign) CGFloat autoScrollTimeInterval;

/** 是否无限循环，默认Yes */
@property (nonatomic, assign) BOOL infiniteLoop;

/** 是否自动滚动，默认Yes */
@property (nonatomic, assign) BOOL autoScroll;

/** 图片滚动方向，默认水平滚动 */
@property (nonatomic, assign) UICollectionViewScrollDirection scrollDirection;

@property (nonatomic, weak) id<XLCycleScrollViewDelegate> delegate;

/** block方式监听点击 */
@property (nonatomic, copy) void (^clickItemOperationBlock)(NSInteger currentIndex);

/** block方式监听滚动 */
@property (nonatomic, copy) void (^itemDidScrollOperationBlock)(NSInteger currentIndex);

//////////////////   自定义样式接口   //////////////////

/** 轮播图片的ContentMode，默认为 UIViewContentModeScaleToFill */
@property (nonatomic, assign) UIViewContentMode bannerImageViewContentMode;

/** 占位图，用于网络为加载到图片时展示 */
@property (nonatomic, strong) UIImage *placeholderImage;

/** 是否显示分页控件 */
@property (nonatomic, assign) BOOL showPageControl;

/** 是否只有一张图时隐藏pagecontrol，默认为YES */
@property (nonatomic, assign) BOOL hideForSinglePage;

/** pagecontrol 样式，默认为动画样式 */
@property (nonatomic, assign) XLCycleScrollViewPageContolStyle pageControlStyle;

/** 分页控件位置 */
@property (nonatomic, assign) XLCyclesScrollViewPageContolAliment pageControlAliment;

/** 分页控件圆标大小 */
@property (nonatomic, assign) CGSize pageControlDotSize;

/** 当前分页控件小圆标颜色 */
@property (nonatomic, strong) UIColor *currentPageDotColor;

/** 其他分页控件小圆标颜色 */
@property (nonatomic, strong) UIColor *pageDotColor;

/** 当前分页控件小圆标图片 */
@property (nonatomic, strong) UIImage *currentPageDotImage;

/** 其他分页控件小圆标图片 */
@property (nonatomic, strong) UIImage *pageDotImage;

/** 轮播文字label的字体颜色 */
@property (nonatomic, strong) UIColor *titleLabelTextColor;

/** 轮播文字label的字体大小 */
@property (nonatomic, strong) UIFont *titleLabelTextFont;

/** 轮播位子label背景颜色 */
@property (nonatomic, strong) UIColor *titleLabelBackgroundColor;

/** 轮播文字label的高度 */
@property (nonatomic, assign) CGFloat titleLabelHeight;


//////////////////   清除缓存接口   //////////////////

/** 清除图片缓存（使用SDWebImage管理图片加载和缓存） */
+ (void)clearImagesCache;




@end
