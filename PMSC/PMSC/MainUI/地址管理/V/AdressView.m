//
//  AdressView.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/25.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "AdressView.h"

@implementation AdressView

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
 
    UIView *foot =[[ UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 600*kScreenHeight)];
    foot.backgroundColor = kHexColor(0xeeeeee);
    self.tableView.tableFooterView = foot;
    
    self.tiwenBtn = [ UIButton buttonWithType:UIButtonTypeCustom];
    [foot addSubview:_tiwenBtn];
    [_tiwenBtn setImage:[UIImage imageNamed:@"添加收货地址@3x"] forState:0];
    _tiwenBtn.sd_layout
    .topSpaceToView(foot,100 *kScreenHeight)
    .leftSpaceToView(foot,-150 *kScreenWidth)
    .widthIs(1020 *kScreenWidth)
    .heightIs(111*kScreenHeight);

}
@end
