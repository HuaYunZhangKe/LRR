//
//  BaseTextField.h
//  键盘
//
//  Created by 杨晓龙 on 16/5/10.
//  Copyright © 2016年 杨晓龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTextField : UITextField

@property(nonatomic,assign)NSInteger count;
+ (void)textFieldDidChange:(UITextField *)textField Count:(NSInteger )count;
- (void)backKeyboard;
@end
