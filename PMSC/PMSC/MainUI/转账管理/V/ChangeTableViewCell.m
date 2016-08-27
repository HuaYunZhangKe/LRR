//
//  ChangeTableViewCell.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ChangeTableViewCell.h"

@interface ChangeTableViewCell ()
@property(nonatomic,retain)UIView *line1;
@property(nonatomic,retain)UIView *line2;
@property(nonatomic,retain)UIView *line3;
@property(nonatomic,retain)UIView *line4;

@end
@implementation ChangeTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.imgView = [UIImageView new];
        [self.contentView addSubview:_imgView];
        self.cLabel = [UILabel new];
        [self.contentView addSubview:_cLabel];
        self.rateLabel = [UILabel new];
        [self.contentView addSubview:_rateLabel];
        self.reciveLabel = [UILabel new];
        [self.contentView addSubview:_reciveLabel];
        self.inputLabel = [UILabel new];
        [self.contentView addSubview:_inputLabel];
        self.inputTf = [BaseTextField new];
        [self.contentView addSubview:_inputTf];
        self.line1 = [UIView new];
        [self.contentView addSubview:_line1];
        self.line2 = [UIView new];
        [self.contentView addSubview:_line2];
        self.line3 = [UIView new];
        [self.contentView addSubview:_line3];
        self.line4 = [UIView new];
        [self.contentView addSubview:_line4];
        self.rJifenLabel = [UILabel new];
        [self.contentView addSubview:_rJifenLabel];
        _inputLabel.font =[ UIFont systemFontOfSize:14];
        _cLabel.font = [UIFont systemFontOfSize:34*kScreenWidth];
        
        _rateLabel.font = [UIFont systemFontOfSize:28*kScreenWidth];
        _reciveLabel.font = [UIFont systemFontOfSize:28*kScreenWidth];
        self.inputTf.backgroundColor = kHexColor(0xeeeeee);
        _line4.backgroundColor = kHexColor(0xeeeeee);
        _line3.backgroundColor = kHexColor(0xeeeeee);
        _line1.backgroundColor = kHexColor(0xeeeeee);

        _line2.backgroundColor = kHexColor(0xeeeeee);
        _rJifenLabel.font = [UIFont systemFontOfSize:34*kScreenWidth];
        _rJifenLabel.textColor = kAppColor;
        self.zhifubtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_zhifubtn];

    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.imgView.frame = CGRectMake(19*kScreenWidth, 16*kScreenHeight, 54*kScreenWidth, 53*kScreenHeight);
    self.cLabel.frame = CGRectMake(_imgView.right + 10 *kScreenWidth, 0, self.contentView.size.width, 85*kScreenHeight);
    _line1.frame = CGRectMake(0, 85*kScreenWidth, self.contentView.size.width, 0.5);
    _rateLabel.frame = CGRectMake(_cLabel.left, _line1.bottom, _cLabel.width, 73*kScreenHeight);
    _line2.frame = CGRectMake(70*kScreenWidth, _rateLabel.bottom, _cLabel.width, 0.5);
    _reciveLabel.frame = CGRectMake(_rateLabel.left, _line2.bottom, _rateLabel.width, _rateLabel.height);
    _line3.frame = CGRectMake(_line2.left, _reciveLabel.bottom, _line2.width, _line2.hidden);
    _inputLabel.frame = CGRectMake(_reciveLabel.left, _line3.bottom, 75, _reciveLabel.height);
    _inputTf.frame = CGRectMake(_inputLabel.right + 10*kScreenWidth, _line3.bottom +12.5*kScreenHeight, 253*kScreenWidth, 48*kScreenHeight);
    _line4.frame = CGRectMake(_line1.left, _inputLabel.bottom, _line1.width, _line1.height);
    self.rJifenLabel.frame = CGRectMake(self.contentView.width - 270*kScreenWidth, _line4.bottom, 270*kScreenWidth, 86*kScreenHeight);
      self.zhifubtn.frame = CGRectMake(self.contentView.right- 50 *kScreenHeight, 21.5*kScreenHeight, 42 *kScreenHeight , 42*kScreenHeight);
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
