//
//  XLQQButton.h
//  qqbutton
//
//  Created by 杨晓龙 on 16/6/3.
//  Copyright © 2016年 杨晓龙. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^KILLBlock)(void);

typedef void(^START)(void);

@interface XLQQButton : UIButton
/** 大圆脱离小圆的最大距离 */
@property (nonatomic, assign) CGFloat        maxDistance;

/** 小圆 */
@property (nonatomic, strong) UIView         *samllCircleView;

/** 按钮消失的动画图片组 */
@property (nonatomic, strong) NSMutableArray *images;
@property (nonatomic, copy) KILLBlock kill;
@property (nonatomic,copy) START start;
@end
