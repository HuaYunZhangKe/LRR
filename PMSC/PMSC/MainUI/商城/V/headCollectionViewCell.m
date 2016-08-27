//
//  headCollectionViewCell.m
//  PMSC
//
//  Created by 李锐 on 16/8/23.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "headCollectionViewCell.h"

@implementation headCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imgView = [UIImageView new];
        [self.contentView addSubview:_imgView];
        _imgView.backgroundColor = [UIColor greenColor];
        
        self.nameLb = [UILabel new];
//        [self.contentView addSubview:_nameLb];
        
    }
    return self;
}
- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    _imgView.frame = CGRectMake(0, 0, 181*kScreenHeight, layoutAttributes.size.height);
    _nameLb.frame = CGRectMake(0, _imgView.bottom, layoutAttributes.size.width, layoutAttributes.size.height);
}

@end
