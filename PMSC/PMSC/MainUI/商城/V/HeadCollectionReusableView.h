//
//  HeadCollectionReusableView.h
//  PMSC
//
//  Created by 李锐 on 16/8/20.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLCycleScrollView.h"
typedef void(^ClickItem)(NSInteger index);

@interface HeadCollectionReusableView : UICollectionReusableView<XLCycleScrollViewDelegate>
@property(nonatomic,retain)UIImageView *imgView;
@property(nonatomic,retain)UICollectionView *kindCollectionView;
@property(nonatomic,retain)UILabel *messageLabel;
@property(nonatomic,retain)UIButton *arrow;
@property (nonatomic, strong) XLCycleScrollView *xlCycleScrollView;
@property (nonatomic, strong) NSArray *imagesURLStrings;/*** 轮播图信息 */
@property (nonatomic, copy) ClickItem click;


@end
