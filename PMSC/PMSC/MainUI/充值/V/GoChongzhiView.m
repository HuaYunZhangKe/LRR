//
//  GoChongzhiView.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/25.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "GoChongzhiView.h"

@implementation GoChongzhiView

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
    _tableView.scrollEnabled = NO;
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 360 *kScreenHeight)];
    headView.backgroundColor = kHexColor(0xeeeeee);
    self.tableView.tableHeaderView = headView;

    for (int i = 0; i < 6; i++) {
        if(i< 3){
            self.duobaobiBtn = [UIButton buttonWithType:UIButtonTypeCustom];

        self.duobaobiBtn .frame = CGRectMake(i*200*kScreenWidth +i*25 *kScreenWidth + 35*kScreenWidth, 42 *kScreenHeight, 200 *kScreenWidth, 70 *kScreenHeight);
            [headView addSubview:_duobaobiBtn];
                     [_duobaobiBtn setTitleColor:kHexColor(0x313131) forState:0];
        [_duobaobiBtn setTitle:@"30夺宝币" forState:0];
            _duobaobiBtn.layer.borderWidth = 1;
            _duobaobiBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
            [self.duobaobiBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            if(self .duobaobiBtn.selected)
            {
                _duobaobiBtn.backgroundColor = kAppColor;
                
            }
    }
        else {
            self.duobaobiBtn = [UIButton buttonWithType:UIButtonTypeCustom];

            self.duobaobiBtn .frame = CGRectMake((i-3)*200*kScreenWidth +(i-3)*25 *kScreenWidth + 35*kScreenWidth, 42 *kScreenHeight + 70 *kScreenHeight+ 30*kScreenHeight, 200 *kScreenWidth, 70 *kScreenHeight);
            [headView addSubview:_duobaobiBtn];
           
            [_duobaobiBtn setTitle:@"50夺宝币" forState:0];
            _duobaobiBtn.layer.borderWidth = 1;
            _duobaobiBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
            [_duobaobiBtn setTitleColor:kHexColor(0x313131) forState:0];
            [self.duobaobiBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            if(self .duobaobiBtn.selected)
            {
                _duobaobiBtn.backgroundColor = kAppColor;
                
            }
            
        }
    }
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(35*kScreenWidth, _duobaobiBtn.bottom + 100*kScreenHeight, 200 *kScreenWidth, 50*kScreenHeight)];
    label.text = @"充值方式";
    [headView addSubview:label];
    UIView *foot =[[ UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 600*kScreenHeight)];
    foot.backgroundColor = kHexColor(0xeeeeee);
    self.tableView.tableFooterView = foot;
    
    self.tiwenBtn = [ UIButton buttonWithType:UIButtonTypeCustom];
    [foot addSubview:_tiwenBtn];
    [_tiwenBtn setTitle:@"立即支付" forState:UIControlStateNormal];
    _tiwenBtn.backgroundColor = kAppColor;
     _tiwenBtn.sd_layout
    .topSpaceToView(foot,100 *kScreenHeight)
    .leftSpaceToView(foot,20 *kScreenWidth)
    .widthIs(680 *kScreenWidth)
    .heightIs(70*kScreenHeight);

    
    
}
-(void)btnClick:(UIButton *)sender
{
    sender.backgroundColor = kAppColor;
    //传值
}
@end
