//
//  ChangeTableViewCell.h
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTextField.h"
@interface ChangeTableViewCell : UITableViewCell
@property(nonatomic,retain)UILabel *rateLabel; //汇率
@property(nonatomic,retain)UILabel *reciveLabel; //可获得夺宝币
@property(nonatomic,retain)BaseTextField *inputTf; // 输入夺宝币
@property(nonatomic,retain)UILabel *rJifenLabel; //可获得积分
@property(nonatomic,retain)UILabel *inputLabel;
@property(nonatomic,retain)UILabel *cLabel;
@property(nonatomic,retain)UIImageView *imgView;
@property(nonatomic,retain)UIButton *zhifubtn; //选择按钮




@end
