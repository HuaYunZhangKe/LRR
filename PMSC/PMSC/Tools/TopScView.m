//
//  TopScView.m
//  UI_封装头部
//
//  Created by dllo on 16/1/14.
//  Copyright © 2016年 蓝鸥科技. All rights reserved.
//

#import "TopScView.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface TopScView ()<UIScrollViewDelegate>

@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) NSMutableArray *buttonArr;

@end

@implementation TopScView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.dataArr = [NSMutableArray array];
        self.buttonArr = [NSMutableArray array];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.frame];
    [self addSubview:_scrollView];
    _scrollView.backgroundColor = kAppColor;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(self.frame.size.width / 5 * _dataArr.count, 0);
    
    if (_dataArr.count < 5) {
        for (NSInteger i = 0; i < _dataArr.count; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(i * self.frame.size.width / _dataArr.count, 0, self.frame.size.width / _dataArr.count, self.frame.size.height);
            [button setTitle:_dataArr[i] forState:UIControlStateNormal];
            [button setTitleColor:kHexColor(0xffffff) forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:28 *kScreenWidth];
            if (i == 0) {
                [button setTitleColor:kHexColor(0xfdf5a0) forState:UIControlStateNormal];
                button.titleLabel.font = [UIFont systemFontOfSize:28 *kScreenWidth];
            }
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [_scrollView addSubview:button];
            [_buttonArr addObject:button];
        }
        self.redView = [[UIView alloc] initWithFrame:CGRectMake(82 *kScreenWidth, self.frame.size.height - 6 *kScreenHeight, 196 *kScreenWidth, 6 *kScreenHeight)];
    } else {
        for (NSInteger i = 0; i < _dataArr.count; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(i * self.frame.size.width / 5, 0, self.frame.size.width / 5, self.frame.size.height);
            [button setTitle:_dataArr[i] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:28 *kScreenWidth];
            if (i == 0) {
                [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                button.titleLabel.font = [UIFont systemFontOfSize:28 *kScreenWidth];
            }
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [_scrollView addSubview:button];
            [_buttonArr addObject:button];
        }
        self.redView = [[UIView alloc] initWithFrame:CGRectMake(82 *kScreenWidth, self.frame.size.height - 6 *kScreenHeight, 196 *kScreenWidth, 6 *kScreenHeight)];
    }
    _redView.backgroundColor = kHexColor(0xfdf5a0);
    [_scrollView addSubview:_redView];
    
}

// 根据传入的h改变按钮
- (void)changeContentOffsetWithH:(CGFloat)h
{
    for (UIButton *button in _buttonArr) {
        [button setTitleColor:kHexColor(0xffffff) forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:28 *kScreenWidth];
    }
    int i = h / SCREEN_WIDTH;
    UIButton *button = _buttonArr[i];
    [button setTitleColor:kHexColor(0xfdf5a0) forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:28 *kScreenWidth];
    NSLog(@"__%f", h);
    if ((int)h) {
        if (_buttonArr.count > 5) {
            if (h == 0 || h == SCREEN_WIDTH || h == SCREEN_WIDTH * 2) {
                [_scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
            } else if (h == SCREEN_WIDTH * (_dataArr.count - 1) || h == SCREEN_WIDTH * (_dataArr.count - 2) || h == SCREEN_WIDTH * _dataArr.count - 3) {
                [_scrollView setContentOffset:CGPointMake(SCREEN_WIDTH / 5 * (_dataArr.count - 5), 0) animated:YES];
            } else {
                [_scrollView setContentOffset:CGPointMake(SCREEN_WIDTH / 5 * h / SCREEN_WIDTH - SCREEN_WIDTH / 5 * 2, 0) animated:YES];
            }
        }
    }
    if (_dataArr.count < 5) {
        [UIView animateWithDuration:0.5 animations:^{
            _redView.frame = CGRectMake(h / _dataArr.count, self.frame.size.height - 6 *kScreenHeight, 196 *kScreenWidth, 6 *kScreenHeight);
        }];
    } else {
        [UIView animateWithDuration:0.5 animations:^{
            _redView.frame = CGRectMake(h / 5, self.frame.size.height - 6 *kScreenHeight, SCREEN_WIDTH / 5, 6 *kScreenHeight);
        }];
    }
}

#pragma mark - button点击事件
- (void)buttonClick:(UIButton *)button
{
    for (UIButton *button in _buttonArr) {
        [button setTitleColor:kHexColor(0xffffff)  forState:UIControlStateNormal];
         button.titleLabel.font = [UIFont systemFontOfSize:28 *kScreenWidth];
    }
    [button setTitleColor:kHexColor(0xfdf5a0) forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:28 *kScreenWidth];
    
    if (_dataArr.count > 5) {
        if (button.frame.origin.x == 0 || button.frame.origin.x == SCREEN_WIDTH / 5 || button.frame.origin.x == SCREEN_WIDTH / 5 * 2) {
            [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
        } else if (button.frame.origin.x == SCREEN_WIDTH / 5 * (self.dataArr.count - 3) || button.frame.origin.x == SCREEN_WIDTH / 5 * (self.dataArr.count - 2) || button.frame.origin.x == SCREEN_WIDTH / 5 * (self.dataArr.count - 1)) {
            [self.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH / 5 * (self.dataArr.count - 5), 0) animated:YES];
        } else {
            [self.scrollView setContentOffset:CGPointMake(button.frame.origin.x - SCREEN_WIDTH / 5 * 2, 0) animated:YES];
        }
    }
    
    if (_dataArr.count < 5) {
        [UIView animateWithDuration:0.5 animations:^{
            _redView.frame = CGRectMake(button.frame.origin.x+82 *kScreenWidth, self.frame.size.height - 6 *kScreenHeight, 196 *kScreenWidth, 6 *kScreenHeight);
        }];
        [self.delegate PassOriginWithX:button.frame.origin.x  * _dataArr.count];
    } else {
        [UIView animateWithDuration:0.5 animations:^{
            _redView.frame = CGRectMake(button.frame.origin.x,self.frame.size.height - 6 *kScreenHeight, SCREEN_WIDTH / 5, 6 *kScreenHeight);
        }];
        [self.delegate PassOriginWithX:button.frame.origin.x * 5];
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
