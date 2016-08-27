//
//  NoShaidanViewController.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "NoShaidanViewController.h"
#import "ShopCollectionViewCell.h"
#import "NoShaidanView.h"
#import "ShaidanCollectionReusableView.h"
@interface NoShaidanViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,retain)NoShaidanView *nView;
@property(nonatomic,retain)NSMutableArray *dataArr;/*** 数据请求数组 */
@property(nonatomic,retain)NSMutableArray *rowArr; /*** 加减号数组 */

@end

@implementation NoShaidanViewController
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
-(NoShaidanView *)nView
{
    if (! _nView) {
        _nView = [[NoShaidanView alloc] initWithFrame:self.view.bounds];
        _nView.collectionView .delegate = self;
        _nView.collectionView.dataSource = self;
    }
    
    return _nView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我的晒单";
    [self.view addSubview:self.nView];
    [_nView.collectionView registerClass: [ShaidanCollectionReusableView class]forSupplementaryViewOfKind:UICollectionElementKindSectionHeader  withReuseIdentifier:@"header"];
    [_nView.collectionView registerClass:[ShopCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    

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
    ShaidanCollectionReusableView *header =[ collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
    [header.arrow addTarget:self action:@selector(rightArrow:) forControlEvents:UIControlEventTouchUpInside];
    [header.phontoBtn addTarget:self action:@selector(phonto:) forControlEvents:UIControlEventTouchUpInside];
    

    return header;
    
    
}

-(void)jiahao:(UIButton *)jia
{
    NSInteger b = [[self.rowArr objectAtIndex:jia.tag - 10000] integerValue];
    b++;
    [self.rowArr replaceObjectAtIndex:jia.tag - 10000 withObject:[NSString stringWithFormat:@"%ld",b ]];
    [self.nView.collectionView reloadData];
    
    
}
-(void)jianhao:(UIButton *)jian
{ NSInteger b = [[self.rowArr objectAtIndex:jian.tag - 10000] integerValue];
    
    if(b> 0)
    {
        b--;
        [self.rowArr replaceObjectAtIndex:jian.tag - 10000 withObject:[NSString stringWithFormat:@"%ld",b ]];
        
        [self.nView.collectionView reloadData];
        
    }
}
-(void)rightArrow:(UIButton *)sender
{
    NSLog(@"热门跳页");
}
-(void)phonto:(UIButton *)btn
{
    //立即晒单
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
