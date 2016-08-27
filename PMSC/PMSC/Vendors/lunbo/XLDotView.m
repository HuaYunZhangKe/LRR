//
//  XLDotView.m
//  lunbo
//
//  Created by 杨晓龙 on 16/5/12.
//  Copyright © 2016年 杨晓龙. All rights reserved.
//

#import "XLDotView.h"

@implementation XLDotView
- (void)initialization
{
    self.backgroundColor = [UIColor clearColor];
    self.layer.cornerRadius = CGRectGetWidth(self.frame) / 2;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.layer.borderWidth = 2;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialization];
    }
    return self;
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
- (void)changeActivityState:(BOOL)active
{
    if (active) {
        self.backgroundColor = [UIColor whiteColor];
    } else
    {
        self.backgroundColor = [UIColor clearColor];
    }
}

@end
