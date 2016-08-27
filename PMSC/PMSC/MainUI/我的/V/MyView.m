//
//  MyView.m
//  PMSC
//
//  Created by 李锐 on 16/8/22.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "MyView.h"

@implementation MyView

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
    self.tableView = [[ UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-64 ) style:UITableViewStylePlain];
    [self addSubview:_tableView];
    _tableView.backgroundColor = kHexColor(0xffffff);
    _tableView.contentInset = UIEdgeInsetsMake(0, 0, 120, 0);
   
    self.headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 345 *kScreenHeight)];
    self.headView.backgroundColor = kHexColor(0xffffff);
    self.tableView.tableHeaderView = self.headView;

    UIView *bgView = [UIView new];
    [self.headView addSubview:bgView];
    UIView *bgView1 =[ UIView new];
    [self.headView  addSubview:bgView1];
   
    UIView *bgView2 = [UIView new];
    [self.headView addSubview:bgView2];
    UIView *line = [UIView new];
//    [bgView2 addSubview:line];
    line.backgroundColor = kHexColor(0xeeeeee);

    bgView.sd_layout
    .topSpaceToView(self.headView,0*kScreenHeight)
    .leftSpaceToView(self.headView,0 *kScreenWidth)
    .rightSpaceToView(self.headView,0)
    .heightIs(133 *kScreenHeight);
    
    bgView1.sd_layout
    .topSpaceToView(bgView,0)
    .leftEqualToView(bgView)
    .rightEqualToView(bgView)
    .heightIs(106*kScreenHeight);
    bgView2.sd_layout
    .topSpaceToView(bgView1,0.5)
    .leftEqualToView(bgView1)
    .rightEqualToView(bgView1)
    .heightRatioToView(bgView1,1);
    bgView.backgroundColor = kHexColor(0xeeeeee);
    bgView1.backgroundColor = kHexColor(0xffffff);
    bgView2.backgroundColor = kHexColor(0xffffff);

    
    self.head = [UIImageView new];
    [self.headView addSubview:_head];
    _head.sd_layout
.topSpaceToView(self.headView,31.5*kScreenHeight)
    .leftSpaceToView(self.headView,19*kScreenWidth)
    .widthIs(70 *kScreenHeight)
    .heightIs(70  *kScreenHeight);
    self.phonelb =[UILabel new];
    [self.headView addSubview:_phonelb];
    _phonelb.sd_layout
    .topSpaceToView(self.headView,0)
    .leftSpaceToView(_head,30 *kScreenWidth)
    .heightRatioToView(bgView,1)
    .widthIs(190 *kScreenWidth);
    _phonelb.text = @"3245566677";
    self.duobaoLb = [UILabel new];
    [self.headView addSubview:_duobaoLb];
    _duobaoLb.sd_layout
    .topSpaceToView(bgView,0)
    .leftSpaceToView(self.headView,21 *kScreenWidth)
    .widthIs(500 *kScreenWidth)
    .heightRatioToView(bgView1,1);
    self.jifenLb = [UILabel new];
    [self.headView addSubview:_jifenLb];
    _jifenLb.sd_layout
    .topSpaceToView(bgView1,0)
    .leftSpaceToView(self.headView,21 *kScreenWidth)
    .widthIs(340 *kScreenWidth)
    .heightRatioToView(bgView2,1);
    self.shangLb= [UILabel new];
//    [headView addSubview:_shangLb];
    _shangLb.sd_layout
    .topEqualToView(_jifenLb)
    .leftSpaceToView(_jifenLb,21*kScreenWidth)
    .widthRatioToView(_jifenLb,1)
    .heightRatioToView(_jifenLb,1);
    line.sd_layout
    .topEqualToView(bgView2)
    .leftSpaceToView(_jifenLb,0)
    .widthIs(0.5)
    .heightRatioToView(_jifenLb,1);
    _duobaoLb.text = @"余额:100夺宝币";
    _jifenLb.text = @"积分: 100000";
    _shangLb.text = @"赏: 10000";
    _jifenLb.font = [UIFont systemFontOfSize:26  *kScreenWidth];
    _shangLb.font = [UIFont systemFontOfSize:26  *kScreenWidth];

    self.rightArrow = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.headView addSubview:_rightArrow];
    [_rightArrow setImage:[UIImage imageNamed:@"大"] forState:0];
    _rightArrow.sd_layout
    .topSpaceToView(self.headView,53.5 *kScreenHeight)
    .rightSpaceToView(self.headView,20*kScreenHeight)
    .widthIs(13 *kScreenHeight)
    .heightIs(26 *kScreenHeight);
    self.chongzhiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.headView addSubview:_chongzhiBtn];
    _chongzhiBtn.backgroundColor = kAppColor;
    [_chongzhiBtn setTitle:@"去充值" forState:0];
    _chongzhiBtn.sd_layout
    .topEqualToView(_duobaoLb)
    .leftSpaceToView(_duobaoLb,0)
    .heightRatioToView(bgView1,1)
    .rightSpaceToView(self.headView,0);
    _chongzhiBtn.titleLabel.font = [UIFont systemFontOfSize:30*kScreenWidth];
    self.head.layer.cornerRadius = _head.width/2;
    _head.backgroundColor = [UIColor redColor];
}
@end
