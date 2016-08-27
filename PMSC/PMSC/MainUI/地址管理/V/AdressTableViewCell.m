//
//  AdressTableViewCell.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/25.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "AdressTableViewCell.h"
#define WIDTH    [UIScreen mainScreen].bounds.size.width / 375
#define HEIGHT   [UIScreen mainScreen].bounds.size.height / 667
@implementation AdressTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.phoneView = [UIImageView new];
        [self.contentView addSubview:_phoneView];
        self.dizhiView = [UIImageView new];
        [self.contentView addSubview:_dizhiView];
        self.timeView = [UIImageView new];
        [self.contentView addSubview:_timeView];
        self.nameLb = [UILabel new];
        [self.contentView addSubview:_nameLb];
        self.phoneLb = [UIButton buttonWithType:UIButtonTypeCustom ];
        [self.contentView addSubview:_phoneLb];
        self.dizhiLb = [ UILabel new];
        [self.contentView addSubview:_dizhiLb];
        self.timeLb = [UILabel new];
        [self.contentView addSubview:_timeLb];
        self.rightArrow = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_rightArrow];
                _phoneView.image = [ UIImage imageNamed:@"图层-3@3x"];
        _dizhiView.image = [ UIImage imageNamed:@"图层-4@3x"];
        _dizhiLb.numberOfLines = 2;
        _nameLb.textColor =kHexColor(0x313131);
        _nameLb.font = [UIFont systemFontOfSize:32 *kScreenWidth];
        _timeLb.textColor =kHexColor(0x9e9e9e);
        _timeLb.font = [UIFont systemFontOfSize:28 *kScreenWidth];
        _dizhiLb.textColor =kHexColor(0x727272);
        _dizhiLb.font = [UIFont systemFontOfSize:28 *kScreenWidth];
        [_phoneLb setTitleColor:kHexColor(0xfe6a01) forState:0];
        _phoneLb.titleLabel.font = [UIFont systemFontOfSize:28 *kScreenWidth];
        [_rightArrow setImage:[UIImage imageNamed:@"矢量智能对象@3x_1"] forState:0];
        
        if([UIScreen mainScreen].bounds.size.width != 320)
        {
            self.imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(20*kScreenWidth,50*kScreenHeight ,375 *WIDTH, 50 *kScreenHeight  )];
            [self.contentView addSubview:self.imageView1];
            
        }
        if([UIScreen mainScreen].bounds.size.width == 320){
            self.imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(20*kScreenWidth,20*HEIGHT , self.contentView .frame.size.width , 50 *HEIGHT  )];
            [self.contentView addSubview:self.imageView1];
            
        }
        
        
        UIGraphicsBeginImageContext(self.imageView1.frame.size);   //开始画线
        [self.imageView1.image drawInRect:CGRectMake(0, 0, 355 *WIDTH, self.imageView1.frame.size.height)];
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);  //设置线条终点形状
        
        
        CGFloat lengths[] = {1,1};
        CGContextRef line = UIGraphicsGetCurrentContext();
        CGContextSetStrokeColorWithColor(line, kHexColor(0xeeeeee).CGColor);
        
        CGContextSetLineDash(line, 0, lengths, 2);  //画虚线
        CGContextMoveToPoint(line, 0.0, 20.0);    //开始画线
        CGContextAddLineToPoint(line, 355.0, 20.0);
        CGContextStrokePath(line);
        
        self.imageView1.image = UIGraphicsGetImageFromCurrentImageContext();
        self.phoneLine = [ UIView new];
        [self.contentView addSubview:_phoneLine];
        _phoneLine.backgroundColor = kHexColor(0xfe6a01);
        
    }
    return  self;
}
-(void)layoutSubviews

{  CGFloat h = [[self class] heightWithText:_dizhiLb.text];
    
    _nameLb.sd_layout
    .topSpaceToView(self.contentView,26 *kScreenHeight)
    .leftSpaceToView(self.contentView,26 *kScreenWidth)
    .widthIs(self.contentView.frame.size.width)
    .heightIs(50 *kScreenHeight);
    _phoneView.sd_layout
    .topSpaceToView(_nameLb,24 *kScreenHeight)
    .leftSpaceToView(self.contentView,26 *kScreenWidth)
    .widthIs(24 *kScreenWidth)
    .heightIs(24 *kScreenWidth);
    
    _dizhiView.sd_layout
    .topSpaceToView(_phoneView, 24 *kScreenHeight)
    .leftSpaceToView(self.contentView,26 *kScreenWidth)
    .widthIs(24 *kScreenWidth)
    .heightIs(24 *kScreenWidth);
    
    
    
    _phoneLb.sd_layout
    .topSpaceToView(_nameLb,25 *kScreenHeight)
    .leftSpaceToView(_phoneView,18 *kScreenWidth)
    .widthIs(200*kScreenWidth)
    .heightIs(30 *kScreenHeight);
    
    _phoneLine.sd_layout
    .topSpaceToView(_phoneLb,0)
    .leftEqualToView(_phoneLb)
    .widthIs(200 *kScreenWidth)
    .heightIs(0.5);
    _dizhiLb.sd_layout
    .topSpaceToView(_phoneLb, 10 *kScreenHeight)
    .leftSpaceToView(_dizhiView,18 *kScreenWidth)
    .widthIs(552 *kScreenWidth)
    .heightIs(h);
    
    _timeLb.sd_layout
    .topSpaceToView(_dizhiLb,10 *kScreenHeight)
    .leftSpaceToView(_timeView,18 *kScreenWidth)
    .widthIs(self.contentView.frame.size.width - 68 *kScreenWidth)
    .heightIs(30 *kScreenHeight);
    
    
    _timeView.sd_layout
    .topSpaceToView(_dizhiLb,10 *kScreenHeight)
    .leftSpaceToView(self.contentView,26 *kScreenWidth)
    .widthIs(24 *kScreenWidth)
    .heightIs(24 *kScreenWidth);
    
    _rightArrow.sd_layout
    .topEqualToView(_nameLb)
    .rightSpaceToView(self.contentView,26 *kScreenWidth)
    .widthIs(41 *kScreenHeight)
    .heightIs(41 *kScreenHeight);
    
    [super layoutSubviews];
    
}
+(CGFloat)heightWithText:(NSString *)text
{
    //保存文本属性(大小)
    NSDictionary *dic = @{NSFontAttributeName:[ UIFont systemFontOfSize:28 *kScreenWidth]};
    //预设尺寸 文本最大不超过这个尺寸
    //根据设置的高度计算高度(宽度和label保持一致)
    CGSize size = CGSizeMake(552 *kScreenWidth , 1000);
    //根据文本 计算出cgrect
    //参数1 尺寸范围
    //参数2 文本属性
    //参数3 按照什么方式获取rect
    CGRect rect = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    //返回得到的高度
    return rect.size.height;
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
