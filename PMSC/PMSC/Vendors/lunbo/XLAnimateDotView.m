//
//  XLAnimateDotView.m
//  lunbo
//
//  Created by 杨晓龙 on 16/5/12.
//  Copyright © 2016年 杨晓龙. All rights reserved.
//

#import "XLAnimateDotView.h"

static CGFloat const kAnimateDuration = 1;
@implementation XLAnimateDotView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialization];
    }
    return self;
}

- (void)initialization
{
    _dotColor = [UIColor whiteColor];
    self.backgroundColor = [UIColor clearColor];
    self.layer.cornerRadius = CGRectGetWidth(self.frame) / 2;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.layer.borderWidth = 2;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialization];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialization];
    }
    return self;
}

- (void)setDotColor:(UIColor *)dotColor
{
    _dotColor = dotColor;
    self.layer.borderColor = dotColor.CGColor;
}
- (void)changeActivityState:(BOOL)active
{
    if (active) {
        [self animageToActiveState];
    }else
    {
        [self animageToDEactiveState];
    }
}
- (void)animageToActiveState
{
    [UIView animateWithDuration:kAnimateDuration delay:0 usingSpringWithDamping:.5 initialSpringVelocity:-20 options:UIViewAnimationOptionCurveLinear animations:^{
        self.backgroundColor = _dotColor;
        self.transform = CGAffineTransformMakeScale(1.4, 1.4);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)animageToDEactiveState
{
    [UIView animateWithDuration:kAnimateDuration delay:0 usingSpringWithDamping:.5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.backgroundColor = [UIColor clearColor];
        self.transform = CGAffineTransformIdentity;
    } completion:nil];
}







@end
