//
//  FahuoTableViewCell.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "FahuoTableViewCell.h"

@implementation FahuoTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.imgView =[ UIImageView new];
        [self.contentView addSubview:_imgView];
        self.titleLabel = [UILabel new];
        [self.contentView addSubview:_titleLabel];
        _imgView.backgroundColor = [UIColor redColor];
        _titleLabel.font = [UIFont systemFontOfSize:30*kScreenWidth];
        self.time = [UILabel new];
        [self.contentView addSubview:_time];
        self.codeLabel = [UILabel new];
        [self.contentView addSubview:_codeLabel];
        self.fahuoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_fahuoBtn];
        _time.font = [UIFont systemFontOfSize:24*kScreenWidth];
        _codeLabel.font = [UIFont systemFontOfSize:24 *kScreenWidth];
        _time.textColor = kHexColor(0x727272);
        _codeLabel.textColor = kHexColor(0x727272);

    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.imgView.frame = CGRectMake(19*kScreenWidth, 16*kScreenHeight, 133*kScreenHeight, 133*kScreenHeight);
    self.titleLabel.frame = CGRectMake(_imgView.right + 15*kScreenWidth,16*kScreenHeight, self.contentView.size.width - (19+133+15)*kScreenWidth, (133)*kScreenHeight /3);
    self.time .frame = CGRectMake(_titleLabel.left, _titleLabel.bottom, _titleLabel.width, _titleLabel.height);
    self.codeLabel.frame = CGRectMake(_titleLabel.left, _time.bottom, _time.width, _time.height);
    self.fahuoBtn.frame = CGRectMake(self.contentView.right - 211*kScreenWidth, _codeLabel.bottom , 201*kScreenWidth, 50*kScreenHeight);
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
