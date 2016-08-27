//
//  ShaidanViewController.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/26.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ShaidanViewController.h"
#import "ShandanView.h"
#import "ShaidanTableViewCell.h"
@interface ShaidanViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,retain)ShandanView *sView;
@end

@implementation ShaidanViewController
-(ShandanView *)sView
{
    if (!_sView) {
        _sView = [[ ShandanView alloc] initWithFrame:self.view.bounds];
        _sView.tableView.delegate = self;
        _sView.tableView.dataSource = self;
        
    }
    return _sView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.sView];
    self.navigationItem.title = @"我的晒单";
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ShaidanTableViewCell *cell = [[ShaidanTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    if(!cell)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    }
    cell.nick .text = @"保佑中个苹果手机";
    cell.title.text = @"(第26期)大富大贵金六福香奈儿";
    cell.shuomingLb.text = @"不会用就别用,瞎用";
    cell.date.text=  @"2015-34-23";
    cell.xinlabel.text = @"10";
    cell.fenLabel.text = @"3";
        return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20 *kScreenHeight;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 451*kScreenHeight;
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
