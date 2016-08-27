//
//  AdressViewController.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/25.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "AdressViewController.h"
#import "AdressView.h"
#import "AdressTableViewCell.h"
@interface AdressViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain)AdressView *adressView;
@property(nonatomic,retain)NSString *addrstring;

@end

@implementation AdressViewController
-(AdressView *)adressView
{
if(!_adressView)
    
{
    _adressView = [[AdressView alloc] initWithFrame:self.view.bounds];
    _adressView.tableView.delegate  =self;
    _adressView.tableView.dataSource = self;
    
}
    return _adressView;
    }

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.adressView];
    self.navigationItem.title = @"地址管理";
    [self.adressView.tableView registerClass:[AdressTableViewCell class] forCellReuseIdentifier:@"cell"];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{   return 1;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{ AdressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.nameLb.text= @"赵四";
    [cell.phoneLb setTitle:@"12454566567" forState:0] ;
    cell.dizhiLb.text = @"地方V附件部分干部";
    self.addrstring = cell.dizhiLb.text;
    return cell;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    CGFloat h = [AdressTableViewCell heightWithText:self.addrstring];
    return 150*kScreenHeight + h;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return  20 *kScreenHeight;
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
