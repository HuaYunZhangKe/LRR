//
//  DuobaoCollectionViewCell.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/26.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "DuobaoCollectionViewCell.h"
#import "DoingTableViewCell.h"
#import "WillDoTableViewCell.h"
#import "DoneTableViewCell.h"
@interface DuobaoCollectionViewCell ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation DuobaoCollectionViewCell
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
    [_tableView registerClass:[DoingTableViewCell class] forCellReuseIdentifier:@"cell"];
    [_tableView registerClass:[WillDoTableViewCell class] forCellReuseIdentifier:@"cell1"];
    [_tableView registerClass:[DoneTableViewCell class] forCellReuseIdentifier:@"cell2"];
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
    if(self.type == 0)
    {
    DoingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.titleLabel.text = @"(第26期)2016猴年大吉高端贺岁";
//    cell.progressView.backgroundColor = [UIColor lightGrayColor];
        cell.progressView.leftColor = [UIColor redColor];
        cell.progressView.rightColor  =[ UIColor yellowColor];
    cell.progresslabel1.text = @"总需:600人  剩余:9人";
    cell.progresslabel1.backgroundColor = kHexColor(0xf2a400);
        return cell;

    }
     else if(self.type == 1)
    {
        WillDoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        cell.titleLabel.text = @"(第26期)2016猴年大吉高端贺岁";
        cell.progressView.backgroundColor = [UIColor lightGrayColor];
        cell.progresslabel1.text = @"总需:600人  剩余:9人";
        cell.progresslabel1.backgroundColor = kHexColor(0xf2a400);
        cell.valueLabel.text = @"价值: 99.00";
        return cell;

    }
    else
    {
        
    DoneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
            cell.titleLabel.text = @"(第26期)2016猴年大吉高端贺岁";
            cell.valueLabel.text = @"价值: 99.00";
        cell.people.text = @"心如止水";
    cell.time.text = @"揭晓时间:2014-12-12";
            return cell;
            
    
    }
  }
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 165*kScreenHeight;
}
@end
