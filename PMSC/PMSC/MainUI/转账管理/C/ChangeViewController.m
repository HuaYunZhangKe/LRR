//
//  ChangeViewController.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ChangeViewController.h"
#import "ChangeView.h"
#import "ChangeTableViewCell.h"
#import "ChangeDetailViewController.h"
@interface ChangeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,retain)ChangeView *cView;
@property(nonatomic,retain)NSArray *arr1;
@property(nonatomic,retain)NSArray *arr2;
@property(nonatomic,retain)NSArray *arr3;
@property(nonatomic,retain)NSArray *arr4;
@property(nonatomic,retain)UIButton *currentBtn;

@end

@implementation ChangeViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar .hidden = YES;
    
}
-(void)viewWillDisappear:(BOOL)animated

{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar .hidden = NO;
    
}
-(ChangeView *)cView
{
    if (!_cView) {
        _cView = [[ChangeView alloc] initWithFrame:self.view.bounds];
        _cView.tableView.delegate  =self;
        _cView.tableView.dataSource = self;
    }
    return _cView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"转账管理";
    [self.view addSubview:self.cView];
    [self.cView.tableView registerClass:[ChangeTableViewCell class] forCellReuseIdentifier:@"cell"];
    self.arr1 = @[@"夺宝币转积分",@"积分转夺宝币"];
    self.arr2 = @[@"输入夺宝币",@"输入积分"];
    self.arr3 = @[@"d-j",@"j-d"];
    self.arr4 = @[@"可获得夺宝币 :",@"可获得积分 :"];
    [self bottomView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"详情" style:UIBarButtonItemStylePlain target:self action:@selector(xiangqing:)];

}
-(void)xiangqing:(UIBarButtonItem *)xiang
{
    [self.navigationController pushViewController:[ChangeDetailViewController new] animated:YES];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _arr4.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
     ChangeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.cLabel.text = _arr1[indexPath.section];
    cell.imgView.image = [UIImage imageNamed:_arr3 [indexPath.section]];
    cell.inputLabel.text = _arr2[indexPath.section];
    cell.rateLabel.text = @"汇率 : 1:1";
    cell.reciveLabel.text = _arr4 [ indexPath.section];
    cell.rJifenLabel.text = @"可获积分: 300";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.zhifubtn setImage:[UIImage imageNamed:@"椭圆-1@3x"] forState:UIControlStateNormal];
    [cell.zhifubtn  setImage:[UIImage imageNamed:@"椭圆-1-副本-2@3x"] forState:UIControlStateSelected];
    [cell.zhifubtn addTarget:self action:@selector(smallBtn:) forControlEvents:UIControlEventTouchUpInside];
    cell.zhifubtn.tag = indexPath.section;
    
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 390 *kScreenHeight;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 18*kScreenHeight;

}
-(void)bottomView
{
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, Screen_HEIGHT - 89*kScreenHeight-64, Screen_WIDTH, 89*kScreenHeight)];
    [self.view addSubview:bgView];
    bgView.backgroundColor = [UIColor whiteColor];
    UIButton *cBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    [cBtn setTitle:@"转换" forState:0];
    [cBtn setTitleColor:[UIColor whiteColor] forState:0];
    cBtn.backgroundColor = kAppColor;
    [bgView addSubview:cBtn];
    cBtn.frame = CGRectMake(320*kScreenWidth, 0, 200*kScreenWidth, bgView.height);
    
    UIButton *canBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    [canBtn setTitle:@"取消" forState:0];
    [canBtn setTitleColor:[UIColor whiteColor] forState:0];
    canBtn.backgroundColor = [UIColor lightGrayColor];
    [bgView addSubview:canBtn];
    canBtn.frame = CGRectMake(cBtn.right, 0, cBtn.width, bgView.height);
    [cBtn addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
    [canBtn addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];

}
-(void)smallBtn:(UIButton *)sender
{
//    sender.selected = !sender.selected;
     ChangeTableViewCell *cell = [self.cView.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    if(sender != cell.zhifubtn)
    {
        
    }
    else
    {
        

    }
    self.currentBtn.selected = NO;
    sender.selected = YES;
    self.currentBtn = sender;
    NSLog(@"点击");
}

-(void)change:(UIButton *)sender
{
    //转换
}
-(void)cancel:(UIButton *)sender
{
    //取消
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
