//
//  ZhongjiangCollectionViewCell.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ZhongjiangCollectionViewCell.h"
#import "FahuoTableViewCell.h"
@interface ZhongjiangCollectionViewCell ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation ZhongjiangCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self= [super initWithFrame:frame];
    if (self) {
        [self  creatView];
        self.backgroundColor = kHexColor(0xeeeeee);
    }
    return self;
}
-(void)creatView
{
    self.tableView = [[ UITableView alloc] initWithFrame:CGRectMake(0, 1, Screen_WIDTH, Screen_HEIGHT ) style:UITableViewStylePlain];
    [self addSubview:_tableView];
    _tableView.backgroundColor =kHexColor(0xeeeeee);
    _tableView.contentInset = UIEdgeInsetsMake(0, 0, 120, 0);
    [_tableView registerClass:[FahuoTableViewCell class] forCellReuseIdentifier:@"cell"];
   
    _tableView.delegate =self;
    _tableView.dataSource = self;
    _tableView.separatorColor =kHexColor(0xeeeeee);
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FahuoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(self.type == 0)
    {
        
        cell.titleLabel.text = @"第(26)期2016猴年大吉贺岁高端工艺品";
        cell.time.text = @"中奖时间: 2016-08-21";
        cell.codeLabel.text = @"中奖日期: 20160521";
        [cell.fahuoBtn setImage:[UIImage imageNamed:@"发货请求"] forState:0];

        
    }
    else if(self.type == 1)
    {
        cell.titleLabel.text = @"第(26)期2016猴年大吉贺岁高端工艺品";
        cell.time.text = @"中奖时间: 2016-08-21";
        cell.codeLabel.text = @"中奖日期: 20160521";
        [cell.fahuoBtn setImage:[UIImage imageNamed:@"发货请求"] forState:0];

        [cell.fahuoBtn setImage:[UIImage imageNamed:@"收货@3x"] forState:0];

        
    }
    else
    {
        cell.titleLabel.text = @"第(26)期2016猴年大吉贺岁高端工艺品";
        cell.time.text = @"中奖时间: 2016-08-21";
        cell.codeLabel.text = @"中奖日期: 20160521";
        [cell.fahuoBtn setImage:[UIImage imageNamed:@"发货请求"] forState:0];

        cell.fahuoBtn .hidden = YES;
        
        
    }
    return cell;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 215*kScreenHeight;
}

@end
