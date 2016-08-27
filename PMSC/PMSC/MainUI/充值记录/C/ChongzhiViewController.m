//
//  ChongzhiViewController.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/25.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ChongzhiViewController.h"
#import "ChongzhiView.h"
#import "ChongzhiTableViewCell.h"
@interface ChongzhiViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,retain)ChongzhiView*chongzhiView;
@end

@implementation ChongzhiViewController

-(ChongzhiView *)chongzhiView
{
    if(!_chongzhiView)
        
    {
        _chongzhiView = [[ChongzhiView alloc] initWithFrame:self.view.bounds];
        self.chongzhiView.tableView.delegate = self;
        self.chongzhiView.tableView.dataSource  =self;
    }
    return _chongzhiView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.chongzhiView];
    [self.chongzhiView .tableView registerClass:[ChongzhiTableViewCell class] forCellReuseIdentifier:@"cell"];
    self.navigationItem.title = @"充值记录";
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ChongzhiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.timeLb.text = @"2016.06.07";
    cell.qudaoLb.text  =@"微信支付";
    cell.moneyLb.text = @"40";
    cell.detail.text = @"07:50:13";
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
     return  104 *kScreenHeight;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
