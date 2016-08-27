//
//  XLTimerButton.h
//  倒计时button
//
//  Created by 杨晓龙 on 16/5/5.
//  Copyright © 2016年 杨晓龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XLTimerButton : UIButton
/**
 * 总的秒数
 *
 **/
@property (nonatomic, assign) NSInteger second;
/**
 * button的title
 *
 **/
@property (nonatomic, strong) NSString *title;
/**
 * 开始方法
 *
 **/
- (void)startTimer;
- (void)stopTimer;
@end
