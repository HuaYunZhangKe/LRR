//
//  ShopViewController.m
//  PMSC
//
//  Created by 李锐 on 16/8/23.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ShopViewController.h"
#import "ShopView.h"
#import "HeadCollectionReusableView.h"
#import "ShopCollectionViewCell.h"
@interface ShopViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,retain)ShopView *shopView;
@property(nonatomic,retain)NSMutableArray *dataArr;/*** 数据请求数组 */
@property(nonatomic,retain)NSMutableArray *rowArr; /*** 加减号数组 */
@property(nonatomic, retain)UISearchBar *searchBar;

@end

@implementation ShopViewController
-(NSMutableArray *)dataArr
{
    if(!_dataArr)
    {
        self.dataArr = [NSMutableArray array];
        
    }
    return _dataArr;
    
}
-(NSMutableArray *)rowArr
{
    if(!_rowArr)
    {
        self.rowArr = [NSMutableArray array];
         self.rowArr =[@[@"0",@"0",@"0",@"0"] mutableCopy];
    }
    return _rowArr;
}
-(ShopView *)shopView
{
    if (!_shopView) {
        self.shopView = [[ShopView alloc] initWithFrame:self.view.bounds];
        self.shopView.collectionView .delegate = self;
        self.shopView.collectionView.dataSource = self;
    }
    return _shopView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.shopView];
    [self.shopView.collectionView registerClass:[ShopCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    self.navigationController.navigationBarHidden = YES;
    [self creatNavi];
    [_shopView.collectionView registerClass: [HeadCollectionReusableView class]forSupplementaryViewOfKind:UICollectionElementKindSectionHeader  withReuseIdentifier:@"header"];
    
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
    {
        return 4;
    }
    
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
    {
        
        ShopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
       cell.title.text = @"第34554飞科剃须刀";
        cell.total.text =@"总量:80 剩余: 20";
        cell.valueLb.text = @"119.00";
        cell.buttonSubtract .tag = indexPath.row +10000;
        cell.buttonAdd .tag = indexPath.row +10000;
        cell.quantity.text =self.rowArr[indexPath.row];
        [cell.buttonAdd addTarget:self action:@selector(jiahao:) forControlEvents:UIControlEventTouchUpInside];
        [cell.buttonSubtract addTarget:self action:@selector(jianhao:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
    {
        //通过kind类型判断 设置相应内容
        //从重用池获取头部视图
        HeadCollectionReusableView *header =[ collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
        [header.arrow addTarget:self action:@selector(rightArrow:) forControlEvents:UIControlEventTouchUpInside];
        header.click = ^(NSInteger index)
        {
            NSLog(@"点击第%ld个图片",index);
        };
        return header;
        
        
    }
    
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
    {
        [_shopView.collectionView deselectItemAtIndexPath:indexPath animated:YES];
        NSLog(@"点击");
    }

-(void)rightArrow:(UIButton *)sender
{
    NSLog(@"热门跳页");
}
-(void)jiahao:(UIButton *)jia
{
    NSInteger b = [[self.rowArr objectAtIndex:jia.tag - 10000] integerValue];
    b++;
    [self.rowArr replaceObjectAtIndex:jia.tag - 10000 withObject:[NSString stringWithFormat:@"%ld",b ]];
    [self.shopView.collectionView reloadData];
    

}
-(void)jianhao:(UIButton *)jian
{ NSInteger b = [[self.rowArr objectAtIndex:jian.tag - 10000] integerValue];
   
    if(b> 0)
    {
        b--;
    [self.rowArr replaceObjectAtIndex:jian.tag - 10000 withObject:[NSString stringWithFormat:@"%ld",b ]];
   
    [self.shopView.collectionView reloadData];

    }
}
-(void)creatNavi
{
    UIView *naviView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    naviView.backgroundColor = kAppColor;
    [self.view addSubview:naviView];
    UIImageView *leftImg =[[ UIImageView alloc] initWithFrame:CGRectMake(10, 45 *kScreenHeight, 120*kScreenWidth, 60*kScreenHeight)];
    leftImg.image = [UIImage imageNamed:@"1元云购"];
    leftImg.backgroundColor = [UIColor whiteColor];
    [naviView addSubview:leftImg];
    UIButton *btn =[ UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"购物车"] forState:0];
    [naviView addSubview:btn];
    btn.frame = CGRectMake(630*kScreenWidth, 45 *kScreenHeight, 72 *kScreenWidth, 52*kScreenHeight);
    // 初始化
    UIButton *titleView = [[UIButton alloc] initWithFrame:CGRectMake( leftImg.right  +20*kScreenWidth, 45*kScreenHeight , 457* kScreenWidth , 59* kScreenHeight )];
    // 点击事件
    [titleView addTarget:self action:@selector(clickOnTitleView) forControlEvents:UIControlEventTouchUpInside];
    // 设置为titleView
    [naviView addSubview:titleView];
    titleView.backgroundColor =[ UIColor whiteColor];
    [titleView setImage:[UIImage imageNamed:@"搜索"] forState:0];
 }
- (void)clickOnTitleView
{
//    SearchViewController *search =[[ SearchViewController alloc] init];
//    [self.navigationController pushViewController:search animated:YES];
    NSLog(@"搜索");
    
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
