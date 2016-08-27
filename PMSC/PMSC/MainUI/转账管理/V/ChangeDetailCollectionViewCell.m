//
//  ChangeDetailCollectionViewCell.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ChangeDetailCollectionViewCell.h"
#import "ChongzhiTableViewCell.h"
@implementation ChangeDetailCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatView1];
    }
    return self;
}
-(void)creatView1
{
    self.tableView = [[ UITableView alloc] initWithFrame:CGRectMake(0, 0*kScreenHeight, self.frame.size.width, self.frame.size.height-64 ) style:UITableViewStylePlain];
    [self addSubview:_tableView];
    _tableView.backgroundColor = kHexColor(0xeaebec);
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[ChongzhiTableViewCell class] forCellReuseIdentifier:@"cell"];
    _tableView.contentInset = UIEdgeInsetsMake(0, 0, 120, 0);
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 73 *kScreenHeight)];
    headView.backgroundColor = kHexColor(0xcacaca);
    self.tableView.tableHeaderView = headView;
    NSArray *arr = @[@"日期",@"方式",@"增减"];
    for(int i= 0;i<arr.count; i++)
    {
        UILabel *label= [[UILabel alloc] initWithFrame:CGRectMake(i*self.frame.size.width/3, 0, self.frame.size.width /3, 73 *kScreenHeight)];
        [headView addSubview:label];
        label.text = arr[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:28 *kScreenWidth];
        label.textColor =kHexColor(0x848484);
        
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.type ==0)
    {    ChongzhiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.timeLb.text = @"2016-06-07";
    cell.qudaoLb.text  =@"转换";
    cell.moneyLb.text = @"-500";
    cell.detail.hidden = YES;
    return cell;
    }
    else{
        ChongzhiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        cell.timeLb.text = @"2016-06-07";
        cell.qudaoLb.text  =@"转换";
        cell.moneyLb.text = @"-500";
        cell.detail.hidden = YES;
        return cell;

    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  52 *kScreenHeight;
}

@end
