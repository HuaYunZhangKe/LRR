//
//  ShopCollectionViewCell.m
//  PMSC
//
//  Created by 李锐 on 16/8/23.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ShopCollectionViewCell.h"

@implementation ShopCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imgView = [UIImageView new];
        [self.contentView addSubview:_imgView];
        _imgView.backgroundColor = [UIColor greenColor];
        self.title = [UILabel new];
        [self.contentView addSubview:_title];
        _title.textColor = kHexColor(0x616161);
        self.total = [UILabel new];
        [self.contentView addSubview:_total];
        _total.textColor = kHexColor(0xa1a1a1);
        self.valueLb = [UILabel new];
        [self.contentView addSubview:_valueLb];
        _valueLb.textColor = kHexColor(0xff5230);
        self.buttonAdd = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_buttonAdd setImage:[UIImage imageNamed:@"加号"] forState:0];
        [self.contentView addSubview:_buttonAdd];
        
        self.quantityImg =[UIImageView new];
        [self.contentView addSubview:_quantityImg];
        _quantityImg.image = [ UIImage imageNamed:@"r_frame_ios"];
        self.quantity = [UILabel new];
        [_quantityImg addSubview:_quantity];
        _quantity.textAlignment = NSTextAlignmentCenter;
        _quantity.font = [UIFont systemFontOfSize:30 *kScreenWidth];
        
        self.buttonSubtract = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_buttonSubtract setImage:[UIImage imageNamed:@"减号 (1)"] forState:0];
        [self.contentView addSubview:_buttonSubtract];
        _total.font = [UIFont systemFontOfSize:30*kScreenWidth];
        _title.font = [UIFont systemFontOfSize:30*kScreenWidth];
        _valueLb.font = [UIFont systemFontOfSize:30*kScreenWidth];


        
    }
    return self;
}
- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    _imgView.frame = CGRectMake((layoutAttributes.size.width -220 *kScreenHeight)/2, 20*kScreenHeight, 220*kScreenHeight, 220 *kScreenHeight);
    _title.frame = CGRectMake(_imgView.left, _imgView.bottom + 20*kScreenHeight,layoutAttributes.size.width , 30*kScreenHeight);
    _total.frame = CGRectMake(_imgView.left, _title.bottom+ 10*kScreenHeight , _title.size.width, 30*kScreenHeight);
    _valueLb.frame = CGRectMake(_imgView.left, _total.bottom+ 10*kScreenHeight, _total.size.width, 30*kScreenHeight);
    _buttonSubtract.sd_layout
    .topSpaceToView(self.valueLb,34 *kScreenHeight)
    .leftSpaceToView(self.contentView,110 *kScreenWidth)
    .widthIs(60 *kScreenHeight)
    .heightIs(43 *kScreenHeight);
    
    
    _quantityImg.sd_layout
    .topSpaceToView(self.valueLb,34 *kScreenHeight)
    .leftSpaceToView(_buttonSubtract,-1*kScreenWidth)
    .widthIs(104 *kScreenHeight)
    .heightIs(43 *kScreenHeight);
    _quantity.sd_layout
    .topEqualToView(_quantityImg)
    .leftEqualToView(_quantityImg)
    .widthRatioToView(_quantityImg,1)
    .heightRatioToView(_quantityImg,1);
    
    _buttonAdd.sd_layout
    .topSpaceToView(self.valueLb,34 *kScreenHeight)
    .leftSpaceToView(_quantityImg,0 *kScreenWidth)
    .widthIs(60 *kScreenHeight)
    .heightIs(43 *kScreenHeight);
    

}

@end
