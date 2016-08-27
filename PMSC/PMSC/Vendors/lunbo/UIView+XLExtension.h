//
//  UIView+XLExtension.h
//  lunbo
//
//  Created by 杨晓龙 on 16/5/12.
//  Copyright © 2016年 杨晓龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#define XLColorCreater(r,g,b,a) [UIColor colorWithRed:(r / 255.) green:(g / 255.) blue:(b / 255.) alpha:a]
@interface UIView (XLExtension)
@property (nonatomic, assign) CGFloat xl_height;
@property (nonatomic, assign) CGFloat xl_width;
@property (nonatomic, assign) CGFloat xl_y;
@property (nonatomic, assign) CGFloat xl_x;
@end
