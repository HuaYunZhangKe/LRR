//
//  XLPageControl.h
//  lunbo
//
//  Created by 杨晓龙 on 16/5/12.
//  Copyright © 2016年 杨晓龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XLPageControlDelegate;


@interface XLPageControl : UIControl

@property (nonatomic, assign) Class dotViewClass;
@property (nonatomic, strong) UIImage *dotImage;
@property (nonatomic, strong) UIImage *currentDotImage;
@property (nonatomic, assign) CGSize dotSize;
@property (nonatomic, strong) UIColor *dotColor;
@property (nonatomic, assign) NSInteger spacingBetweenDots;
@property (nonatomic, assign) id<XLPageControlDelegate> delegate;
@property (nonatomic, assign) NSInteger numberOfOages;
@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, assign) BOOL hidesForSinglePage;
@property (nonatomic, assign) BOOL shouldResizefFromCenter;


- (CGSize)sizeForNumberOfPages:(NSInteger)pageCount;



@end

@protocol XLPageControlDelegate <NSObject>

@optional
- (void)XLPageConrol:(XLPageControl *)pageControl didSelectPageAtIndex:(NSInteger)index;

@end