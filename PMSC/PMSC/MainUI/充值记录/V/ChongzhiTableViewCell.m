//
//  ChongzhiTableViewCell.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/25.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ChongzhiTableViewCell.h"

@implementation ChongzhiTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.timeLb = [UILabel new];
        [self.contentView addSubview:_timeLb];
        self.qudaoLb = [UILabel new];
        [self.contentView addSubview:_qudaoLb];
        self.moneyLb = [UILabel new];
        [self.contentView addSubview:_moneyLb];
        self.detail = [UILabel new];
        [self.contentView addSubview:_detail];
        self.timeLb.textAlignment  = NSTextAlignmentCenter;
        self.qudaoLb.textAlignment  = NSTextAlignmentCenter;
        self.moneyLb.textAlignment  = NSTextAlignmentCenter;
         self.detail.textAlignment  = NSTextAlignmentCenter;
        self.timeLb.font = [UIFont systemFontOfSize:28 *kScreenWidth];
        self.qudaoLb.font = [UIFont systemFontOfSize:28 *kScreenWidth];
        self.moneyLb.font = [UIFont systemFontOfSize:28 *kScreenWidth];
        self.detail.font = [UIFont systemFontOfSize:20 *kScreenWidth];

    }
    
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    _timeLb.sd_layout
    .topSpaceToView(self.contentView,0)
    .leftSpaceToView(self.contentView,0 *kScreenWidth)
    .widthIs(240 *kScreenWidth)
    .heightIs(52*kScreenHeight);
    self.qudaoLb.sd_layout
    .topEqualToView(_timeLb)
    .leftSpaceToView(_timeLb,0*kScreenWidth)
    .widthIs(240 *kScreenWidth)
    .heightIs(52 *kScreenHeight);
    self.moneyLb.sd_layout
    .topEqualToView(_qudaoLb)
    .leftSpaceToView(_qudaoLb, 0 *kScreenWidth)
    .widthIs(240 *kScreenWidth)
    .heightRatioToView(_qudaoLb,1);
    self.detail.sd_layout
    .topSpaceToView(_timeLb,0 *kScreenWidth)
    .leftEqualToView(_timeLb)
    .widthIs(240 *kScreenWidth)
    .heightRatioToView(_timeLb,0.8);

    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
