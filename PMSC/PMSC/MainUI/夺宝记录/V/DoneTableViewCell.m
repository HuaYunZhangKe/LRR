//
//  DoneTableViewCell.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/26.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "DoneTableViewCell.h"

@implementation DoneTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.imgView =[ UIImageView new];
        [self.contentView addSubview:_imgView];
        self.titleLabel = [UILabel new];
        [self.contentView addSubview:_titleLabel];
        self.valueLabel = [UILabel new];
        [self.contentView addSubview:_valueLabel];
        self.people =[ UILabel new];
        [self.contentView addSubview:_people];
        self.time = [UILabel new];
        [self.contentView addSubview:_time];
        _imgView.backgroundColor = [UIColor redColor];
        _titleLabel.font = [UIFont systemFontOfSize:26*kScreenWidth];
        self.valueLabel.textColor = kHexColor(0xbdbdbd);
        _valueLabel.font = [UIFont systemFontOfSize:24*kScreenWidth];
        _people.font = [UIFont systemFontOfSize:24*kScreenWidth];
        _time.font = [UIFont systemFontOfSize:24*kScreenWidth];
        self.people.textColor = kHexColor(0xbdbdbd);
        self.time.textColor = kHexColor(0xbdbdbd);
      

    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.imgView.frame = CGRectMake(19*kScreenWidth, 16*kScreenHeight, 133*kScreenHeight, 133*kScreenHeight);
    self.titleLabel.frame = CGRectMake(_imgView.right + 15*kScreenWidth,16*kScreenHeight, self.contentView.size.width - (19+133+15)*kScreenWidth, (133-32)*kScreenHeight /3);
    self.valueLabel.frame = CGRectMake(_titleLabel.left, _titleLabel.bottom+ 10*kScreenHeight, _titleLabel.width, 30*kScreenHeight);
    self.people .frame = CGRectMake(_titleLabel.left, _valueLabel.bottom, _valueLabel.width, 30*kScreenHeight);
    self.time .frame = CGRectMake(_titleLabel.left, _people.bottom, _people.width, 30*kScreenHeight);
    
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
