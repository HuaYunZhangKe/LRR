//
//  GoChongzhiViewController.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/25.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "GoChongzhiViewController.h"
#import "GoChongzhiView.h"
#import "GoTableViewCell.h"
@interface GoChongzhiViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain)GoChongzhiView *goView;
@property(nonatomic,retain)NSArray *imgArr;
@property(nonatomic,retain)NSArray *nameArr;
@end

@implementation GoChongzhiViewController
-(GoChongzhiView *)goView
{
    if (!_goView) {
        _goView = [[GoChongzhiView alloc] initWithFrame:self.view.bounds];
        _goView.tableView.delegate =self;
        _goView.tableView.dataSource = self;
    }
    return _goView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"充值";
    [self.view addSubview:self.goView];
    [self.goView.tableView registerClass:[GoTableViewCell class] forCellReuseIdentifier:@"cell"];
    

    self.imgArr = @[@"weixin@3x_1",@"zhifubao@3x_2"];
    self.nameArr = @[@"微信",@"支付宝"];

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _nameArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    GoTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
   
    cell.imgView.image =[UIImage imageNamed:_imgArr[indexPath.row]];
    cell.name.text = _nameArr[indexPath.row];
    [cell.zhifubtn addTarget:self action:@selector(smallBtn:) forControlEvents:UIControlEventTouchUpInside];
    [cell.zhifubtn setImage:[UIImage imageNamed:@"椭圆-1@3x"] forState:UIControlStateNormal];
    [cell.zhifubtn  setImage:[UIImage imageNamed:@"椭圆-1-副本-2@3x"] forState:UIControlStateSelected];

        return cell;
    
}

-(void)smallBtn:(UIButton *)sender
{
    sender.selected = !sender.selected;
    NSLog(@"点击");
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
