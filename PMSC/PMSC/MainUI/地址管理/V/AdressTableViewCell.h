//
//  AdressTableViewCell.h
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/25.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdressTableViewCell : UITableViewCell
@property(nonatomic,retain)UIImageView *phoneView;
@property(nonatomic,retain)UIImageView *dizhiView;
@property(nonatomic,retain)UIImageView *timeView;
@property(nonatomic,retain)UILabel *nameLb;
@property(nonatomic,retain)UIButton *phoneLb;
@property(nonatomic,retain)UILabel *dizhiLb;
@property(nonatomic,retain)UILabel *timeLb;
@property(nonatomic,retain)UIButton *rightArrow;
+(CGFloat)heightWithText:(NSString *)text;
@property(nonatomic,retain)UIImageView *imageView1;
@property(nonatomic,retain)UIView *phoneLine;
@end
