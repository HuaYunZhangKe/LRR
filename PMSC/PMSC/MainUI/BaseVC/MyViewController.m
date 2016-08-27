//
//  MyViewController.m
//  PMSC
//
//  Created by 李锐 on 16/8/22.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "MyViewController.h"
#import "MyView.h"
#import "HelpViewController.h"
#import "ChongzhiViewController.h"
#import "AdressViewController.h"
#import "GoChongzhiViewController.h"
#import "DuobaojiluViewController.h"
#import "SetViewController.h"
#import "ShaidanViewController.h"
#import "NoShaidanViewController.h"
#import "ZhongjiangViewController.h"
#import "ChangeViewController.h"
#import "InviteFriendViewController.h"
@interface MyViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain)MyView *myView;
@property(nonatomic,retain)NSArray *dataArr;
@property(nonatomic,retain)NSArray *imgArr;
@end

@implementation MyViewController
#pragma mark - 懒加载
-(NSArray *)dataArr
{
    if(!_dataArr)
    {
        _dataArr = @[@[@"夺宝记录",@"中奖收货",@"我的晒单"],@[@"充值记录",@"地址管理",@"转账管理"],@[@"邀请好友",@"每日签到"],@[@"帮助",@"发帖管理",@"投注记录"]];
    }
    return _dataArr;
    
}
-(NSArray *)imgArr
{
    if(!_imgArr)
    {
        _imgArr = @[@[@"my1",@"my2",@"my3"],@[@"my4",@"my5",@"my6"],@[@"my7",@"my8"],@[@"my9",@"my10",@"my11"]];
           
    }
    return _imgArr;
}
- (MyView *)myView
{
    if (!_myView)
    {
        self.myView = [[MyView alloc] initWithFrame:self.view.bounds];
        _myView.tableView.dataSource = self;
        _myView.tableView.delegate = self;
        
    }
    return _myView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我的";
    [self.view addSubview:self.myView];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.myView.chongzhiBtn addTarget:self action:@selector(chongzhi:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"设置"] style:UIBarButtonItemStylePlain target:self action:@selector(right)];
    UITapGestureRecognizer *tap =[[ UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self.myView.headView addGestureRecognizer:tap];
    [self.myView.rightArrow addTarget:self action:@selector(tapAction:) forControlEvents:UIControlEventTouchUpInside];

}
-(void)tapAction:(UIButton *)sender
{
    //基本信息
}
#pragma mark - barButton
-(void)right{
    [self.navigationController pushViewController:[SetViewController new] animated:YES];
}
#pragma mark - tableView dataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArr[section] count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    if(!cell)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    }
    cell.textLabel.text = _dataArr[indexPath.section][indexPath.row];
    cell.textLabel.textColor = kHexColor(0x000000);
    cell.imageView.image = [UIImage imageNamed:self.imgArr[indexPath.section][indexPath.row]];
    cell.textLabel.font = [UIFont systemFontOfSize: 30 *kScreenWidth];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
       return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 12 *kScreenHeight;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.section == 1 && indexPath.row == 0)
    {
        [self.navigationController pushViewController:[ChongzhiViewController new] animated:YES];
    }
    if(indexPath.section == 3&&indexPath.row == 0)
    {
        [self.navigationController pushViewController:[HelpViewController new] animated:YES];
        
    }
    if(indexPath.section == 1&&indexPath.row == 1)
    {
        [self.navigationController pushViewController:[AdressViewController new] animated:YES];
        
    }
    if(indexPath.section == 0 && indexPath.row == 0)
    {
        [self.navigationController pushViewController:[DuobaojiluViewController new] animated:YES];
    }
    if (indexPath.section == 0&& indexPath.row == 2) {
        [self.navigationController pushViewController:[NoShaidanViewController new] animated:YES];
    }
    if (indexPath.section == 0 && indexPath.row == 1) {
    [self.navigationController pushViewController:[ZhongjiangViewController new] animated:YES];
    }
    if (indexPath.section == 1 && indexPath.row == 2) {
        [self.navigationController pushViewController:[ChangeViewController new] animated:YES];
    }
    if (indexPath.section == 2 && indexPath.row == 0) {
        InviteFriendViewController *invite = [[InviteFriendViewController alloc] initWithNibName:@"InviteFriendViewController" bundle:nil];
        [self.navigationController pushViewController:invite animated:YES];
    }


}
-(void)chongzhi:(UIButton *)sender
{
    [self.navigationController pushViewController:[GoChongzhiViewController new] animated:YES];
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
