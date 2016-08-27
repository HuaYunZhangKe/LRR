//
//  XLTimerButton.m
//  倒计时button
//
//  Created by 杨晓龙 on 16/5/5.
//  Copyright © 2016年 杨晓龙. All rights reserved.
//

#import "XLTimerButton.h"

@interface XLTimerButton ()
{
    dispatch_source_t _timer;
}
@end


@implementation XLTimerButton

- (void)startTimer
{
    
     __block NSInteger timeout = self.second; // 倒计时时间
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
     _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 *NSEC_PER_SEC, 0); // 每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if (timeout <= 0) {// 倒计时结束关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setTitle:self.title forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
            });
        }else
        {
            int seconds = 0;
            if (timeout % 60 == 0) {
                seconds = 60;
            }else
            {
                seconds = timeout % 60;
            }
            NSString *strTime = [NSString stringWithFormat:@"%.2d",seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1];
                [self setTitle:[NSString stringWithFormat:@"%@秒后重新发送",strTime] forState:UIControlStateNormal];
                [UIView commitAnimations];
                self.userInteractionEnabled = NO;
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
    
}
- (void)stopTimer
{
    dispatch_source_cancel(_timer);
    dispatch_async(dispatch_get_main_queue(), ^{
        [self setTitle:self.title forState:UIControlStateNormal];
        self.userInteractionEnabled = YES;
    });
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
