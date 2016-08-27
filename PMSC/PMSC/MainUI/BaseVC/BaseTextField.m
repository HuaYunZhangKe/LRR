//
//  BaseTextField.m
//  键盘
//
//  Created by 杨晓龙 on 16/5/10.
//  Copyright © 2016年 杨晓龙. All rights reserved.
//

#import "BaseTextField.h"

@interface BaseTextField ()<UITextFieldDelegate>

@end
@implementation BaseTextField
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self backKeyboard];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self backKeyboard];
    }
    return self;
}

- (void)backKeyboard
{
    
    UIToolbar * topView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
    [topView setBarStyle:UIBarStyleDefault];
    topView.tag = 10001;
    UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(2, 5, 50, 25);
    [btn addTarget:self action:@selector(dismissKeyBoard) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"完成" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithRed:0.0863 green:0.5216 blue:0.8392 alpha:1.0] forState:UIControlStateNormal];
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc]initWithCustomView:btn];
    NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace, doneBtn,nil];
    [topView setItems:buttonsArray];
    [self setInputAccessoryView:topView];
    
}
-(void)dismissKeyBoard
{
    NSLog(@"~~~");
    UIToolbar *tao = [self viewWithTag:10001];
    [tao removeFromSuperview];
    [self resignFirstResponder];
}
/*** 限制字符输入 */

+ (void)textFieldDidChange:(UITextField *)textField Count:(NSInteger )count
{
    
    if (textField.text.length > count) {
        textField.text = [textField.text substringToIndex:count];
    }
    
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self)
    {
        if (string.length == 0) return YES;
        
        NSInteger existedLength = textField.text.length;
        NSInteger selectedLength = range.length;
        NSInteger replaceLength = string.length;
        if (existedLength - selectedLength + replaceLength > _count) {
            return NO;
        }
    }
    return YES;
}

@end
