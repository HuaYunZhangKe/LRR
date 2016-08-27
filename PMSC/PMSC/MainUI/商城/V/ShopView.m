//
//  ShopView.m
//  PMSC
//
//  Created by 李锐 on 16/8/23.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ShopView.h"

@implementation ShopView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatView];
    }
    return self;
}
-(void)creatView
{
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.itemSize = CGSizeMake(720*kScreenWidth /2 - 2*kScreenWidth,477*kScreenHeight);
    flow.minimumLineSpacing = 1;
    flow.minimumInteritemSpacing = 1;
    flow.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    flow.headerReferenceSize = CGSizeMake(self.frame.size.width, 886*kScreenHeight);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-64) collectionViewLayout:flow];

    _collectionView.backgroundColor =  kHexColor(0xeeeeee);
    [self addSubview:_collectionView];

}

@end
