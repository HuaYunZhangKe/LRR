//
//  LRProgress.h
//  ProgressTest
//
//  Created by 张科 on 16/8/26.
//  Copyright © 2016年 张科. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LRProgress : UIView
@property (nonatomic, retain)UIView *leftView;
@property (nonatomic, retain)UIView *rightView;
@property (nonatomic, retain)UIColor *leftColor;
@property (nonatomic, retain)UIColor *rightColor;
@property (nonatomic, assign)CGFloat progress;
@end
