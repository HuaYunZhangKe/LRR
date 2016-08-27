//
//  ChangeDetailViewController.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ChangeDetailViewController.h"
#import "ChangeDetailView.h"
#import "ChangeDetailCollectionViewCell.h"
@interface ChangeDetailViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,TopScViewOriginDelegate>
@property(nonatomic,retain)ChangeDetailView *cDView;
@end

@implementation ChangeDetailViewController
-(ChangeDetailView *)cDView
{
    if (!_cDView) {
        _cDView = [[ChangeDetailView alloc] initWithFrame:self.view.bounds];
        self.cDView.collectionView.delegate = self;
        self.cDView.collectionView.dataSource  =self;
        self.cDView.top.delegate = self;
    }
    return _cDView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.cDView];
       self.navigationItem.title = @"详情";
    [_cDView.collectionView registerClass:[ChangeDetailCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];

}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
    {
        ChangeDetailCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        cell.type =0;
        return cell;
        
    }
    
    else{
        ChangeDetailCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        cell.type = 1;
        return cell;
        
    }
}

- (void)PassOriginWithX:(CGFloat)x
{
    [_cDView.collectionView setContentOffset:CGPointMake(x, 0) animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"%f", scrollView.contentOffset.x);
    // 把collectionView的位移传入TopScView中
    if([UIScreen mainScreen].bounds.size.width != 320)
    {
        [self.cDView.top changeContentOffsetWithH:(_cDView.collectionView.contentOffset.x + 82 )]
        ;
    }
    else{
        [self.cDView.top changeContentOffsetWithH:(_cDView.collectionView.contentOffset.x + 75 )];
        
    }
    
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
