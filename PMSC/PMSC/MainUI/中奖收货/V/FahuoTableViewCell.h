//
//  FahuoTableViewCell.h
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FahuoTableViewCell : UITableViewCell
@property(nonatomic,retain)UIImageView *imgView;
@property(nonatomic,retain)UILabel *titleLabel;
@property(nonatomic,retain)UILabel *time; //中奖时间
@property(nonatomic,retain)UILabel *codeLabel; //中奖期号
@property(nonatomic,retain)UIButton *fahuoBtn;
@end
