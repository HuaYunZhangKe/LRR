//
//  ShandanView.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/26.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ShandanView.h"

@implementation ShandanView

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
    _tableView.backgroundColor = kHexColor(0xffffff);
    _tableView.contentInset = UIEdgeInsetsMake(0, 0, 120, 0);
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

@end
