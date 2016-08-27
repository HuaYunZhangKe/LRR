//
//  LRProgress.m
//  ProgressTest
//
//  Created by 张科 on 16/8/26.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "LRProgress.h"

@implementation LRProgress

-(instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.leftView];
        [self addSubview:self.rightView];

    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self addSubview:self.leftView];
        [self addSubview:self.rightView];
    }
    return self;
}
- (UIView *)leftView
{
    if (!_leftView)
    {
        _leftView = [UIView new];
    }
    return _leftView;
}
- (UIView *)rightView
{
    if (!_rightView)
    {
        _rightView = [UIView new];
    }
    return _rightView;
}
- (void)setProgress:(CGFloat )progress
{
    if (progress <= 1.0)
    {
        self.leftView.frame = CGRectMake(0, 0, progress *self.width , self.height);
        self.rightView.frame = CGRectMake(self.leftView.right + 0.1, 0, (1-progress) *self.width, self.height - 0.3);
    }
}
- (void)setLeftColor:(UIColor *)leftColor
{
    self.leftView.backgroundColor = leftColor;
}
- (void)setRightColor:(UIColor *)rightColor
{
    self.rightView.backgroundColor = rightColor;
}
@end
