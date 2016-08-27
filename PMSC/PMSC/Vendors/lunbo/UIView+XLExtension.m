//
//  UIView+XLExtension.m
//  lunbo
//
//  Created by 杨晓龙 on 16/5/12.
//  Copyright © 2016年 杨晓龙. All rights reserved.
//

#import "UIView+XLExtension.h"

@implementation UIView (XLExtension)
- (CGFloat)xl_height
{
    return self.frame.size.height;
}
- (void)setXl_height:(CGFloat)xl_height
{
    CGRect temp = self.frame;
    temp.size.height = xl_height;
    self.frame = temp;
}
- (CGFloat)xl_width
{
    return self.frame.size.width;
}
- (void)setXl_width:(CGFloat)xl_width
{
    CGRect temp = self.frame;
    temp.size.width = xl_width;
    self.frame = temp;
}
- (CGFloat)xl_y
{
    return self.frame.origin.y;
}
- (void)setXl_y:(CGFloat)xl_y
{
    CGRect temp = self.frame;
    temp.origin.y = xl_y;
    self.frame = temp;
}
- (CGFloat)xl_x
{
    return self.frame.origin.x;
}
- (void)setXl_x:(CGFloat)xl_x
{
    CGRect temp = self.frame;
    temp.origin.x = xl_x;
    self.frame = temp;
}
@end
