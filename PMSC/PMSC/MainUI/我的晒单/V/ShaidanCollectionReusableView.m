//
//  ShaidanCollectionReusableView.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ShaidanCollectionReusableView.h"

@implementation ShaidanCollectionReusableView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kHexColor(0xeeeeee);
        [self createBasicView];
        
       
        
        
    }
    return self;
}
-(void)createBasicView{
    self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(244 *kScreenWidth, 74*kScreenHeight, 226*kScreenHeight, 226*kScreenHeight)];
    [self addSubview:_imgView];
    _imgView.backgroundColor = [UIColor yellowColor];
    _imgView.layer.cornerRadius = _imgView.width /2;
    _imgView.image = [ UIImage imageNamed:@"photo@3x"];
    self.label = [[UILabel alloc ] initWithFrame:CGRectMake(0, _imgView.bottom + 49*kScreenHeight, Screen_WIDTH, 15)];
    [self addSubview:_label];
    _label.font = [UIFont systemFontOfSize:15];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.text = @"亲,您还没有晒单哦!";
    self.phontoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _phontoBtn.frame = CGRectMake(115*kScreenWidth, _label.bottom+62*kScreenHeight, 490*kScreenWidth, 72*kScreenHeight);
    [self addSubview:_phontoBtn];
    [_phontoBtn setImage:[UIImage imageNamed:@"立即晒单@3x"] forState:0];
    UIView *bgView1 = [UIView new];
    [self addSubview:bgView1];
    bgView1.backgroundColor = [UIColor whiteColor];
    bgView1.sd_layout
    .topSpaceToView(_phontoBtn,78 *kScreenHeight)
    .leftEqualToView(self)
    .rightEqualToView(self)
    .heightIs(80*kScreenHeight);
    UILabel *label1 =[ UILabel new];
    [self addSubview:label1];
    label1.sd_layout
    .topSpaceToView(_phontoBtn,78*kScreenHeight)
    .leftSpaceToView(self,18*kScreenHeight)
    .widthIs(200*kScreenHeight)
    .heightIs(bgView1.height);
    label1.text= @"猜你喜欢";
    label1.textColor  =kAppColor;
    
    self.arrow= [UIButton buttonWithType:UIButtonTypeCustom];
    [bgView1 addSubview:_arrow];
    _arrow.frame = CGRectMake(683*kScreenWidth, 23*kScreenHeight, 19*kScreenHeight, 33*kScreenHeight);
    [_arrow setImage:[UIImage imageNamed:@"箭头"] forState:0];


}

@end
