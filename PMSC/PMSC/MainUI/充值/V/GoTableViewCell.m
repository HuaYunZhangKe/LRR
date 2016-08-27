//
//  GoTableViewCell.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/25.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "GoTableViewCell.h"

@implementation GoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.userInteractionEnabled  =YES;
        self.imgView = [UIImageView new];
        [self.contentView addSubview:_imgView];
        self.name = [UILabel new];
        [self.contentView addSubview:_name];
        self.zhifubtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_zhifubtn];
        self.name.font = [ UIFont systemFontOfSize:28 *kScreenWidth];
        _zhifubtn.userInteractionEnabled = YES;
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.imgView.frame = CGRectMake(20 *kScreenWidth,20 *kScreenHeight, 35*kScreenWidth,35*kScreenHeight );
    self.name.frame = CGRectMake(_imgView.right+10 *kScreenWidth, 0, 100 *kScreenWidth, self.contentView.height);
    self.zhifubtn.frame = CGRectMake(self.contentView.right- 44 *kScreenHeight, 20*kScreenHeight, 42 *kScreenHeight , 42*kScreenHeight);
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
