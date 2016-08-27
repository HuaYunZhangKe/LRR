//
//  ShopCollectionViewCell.h
//  PMSC
//
//  Created by 李锐 on 16/8/23.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopCollectionViewCell : UICollectionViewCell
@property(nonatomic,retain)UIImageView *imgView;
@property(nonatomic,retain)UILabel *title;
@property(nonatomic,retain)UILabel *total;
@property(nonatomic,retain)UILabel *valueLb;
@property (nonatomic, strong) UIButton *buttonAdd;

@property (nonatomic, strong) UIButton *buttonSubtract;

@property (nonatomic, strong) UILabel *quantity;
@property(nonatomic,retain)UIImageView *quantityImg;
@end
