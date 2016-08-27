//
//  DuobaojiluView.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/26.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "DuobaojiluView.h"

@implementation DuobaojiluView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self topView];
    }
    return self;
}
-(void)topView
{self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 105*kScreenHeight)];
    [self addSubview:self.bgView];
    self.bgView.backgroundColor = [UIColor whiteColor];
    self.firstBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.bgView addSubview:_firstBtn];
    _firstBtn.frame = CGRectMake(0, 0, self.bgView.frame.size.width /3, self.bgView.height) ;
    [_firstBtn setTitle:@"进行中" forState:0];

    self.sencondBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.bgView addSubview:_sencondBtn];
    _sencondBtn.frame = CGRectMake(_firstBtn.right, 0, self.bgView.frame.size.width /3, self.bgView.height) ;
    [_sencondBtn setTitle:@"待揭晓" forState:0];
    self.thirdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.bgView addSubview:_thirdBtn];
    _thirdBtn.frame = CGRectMake(_sencondBtn.right,0 , self.bgView.frame.size.width /3, self.bgView.height) ;
    [_thirdBtn setTitle:@"已揭晓" forState:0];
    [_firstBtn setTitleColor:kAppColor forState:0];
    [_sencondBtn setTitleColor:[UIColor blackColor] forState:0];
    [_thirdBtn setTitleColor:[UIColor blackColor] forState:0];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.itemSize = CGSizeMake(self.frame.size.width, self.frame.size.height - 64);
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 107*kScreenWidth, self.frame.size.width, self.frame.size.height - 64) collectionViewLayout:flowLayout];
    self.collectionView.pagingEnabled = YES;
    [self addSubview:_collectionView];
    _collectionView.backgroundColor = kHexColor(0xeeeeee);
    
    
}

@end
