//
//  ChongzhiView.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/25.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ChongzhiView.h"

@implementation ChongzhiView

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
    _tableView.backgroundColor = kHexColor(0xeaebec);
    _tableView.contentInset = UIEdgeInsetsMake(0, 0, 120, 0);
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 235 *kScreenHeight)];
    headView.backgroundColor = kHexColor(0xeeeeee);
    self.tableView.tableHeaderView = headView;
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 150 *kScreenHeight)];
    [headView addSubview:bgView];
    bgView.backgroundColor = kAppColor;
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(10*kScreenWidth, 30*kScreenWidth, 114*kScreenWidth, 89 *kScreenHeight)];
    [bgView addSubview:img];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(img.right+ 10 *kScreenWidth, img.top, 100 *kScreenWidth, 89 *kScreenHeight)];
    [bgView addSubview:label];
    self.totalLb = [[UILabel alloc] initWithFrame:CGRectMake(headView.right - 212 *kScreenWidth, label.top, 212*kScreenWidth, 89 *kScreenHeight )];
    [bgView addSubview:_totalLb];
    img.image = [ UIImage imageNamed:@"矢量智能对象@3x"];
    label.text = @"总充值:";
    _totalLb.text = @"1000";
    label.font = [UIFont systemFontOfSize:28 *kScreenWidth];
    label.textColor = [UIColor whiteColor];
    _totalLb.textAlignment = NSTextAlignmentCenter;
    UIView *bgView1 =[[ UIView alloc] initWithFrame:CGRectMake(0, bgView.bottom + 12 *kScreenHeight, self.frame.size.width, 73 *kScreenHeight)];
    [headView addSubview:bgView1];
    bgView1.backgroundColor = kHexColor(0xcacaca);
    NSArray *arr = @[@"充值时间",@"资金渠道",@"充值金额"];
    for(int i= 0;i<arr.count; i++)
    {
        UILabel *label= [[UILabel alloc] initWithFrame:CGRectMake(i*self.frame.size.width/3, 0, self.frame.size.width /3, 73 *kScreenHeight)];
        [bgView1 addSubview:label];
        label.text = arr[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:28 *kScreenWidth];
        label.textColor =kHexColor(0x848484);

    }
    
}

@end
