//
//  HelpView.m
//  PMSC
//
//  Created by 李锐 on 16/8/23.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "HelpView.h"

@interface HelpView ()<UICollectionViewDataSource,UICollectionViewDelegate,TopScViewOriginDelegate>
@property(nonatomic,retain)UICollectionView *collectionView;

@end
@implementation HelpView

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
        [self creatTable];
    }
    return self;
}
-(void)creatView
{
    self.top =[[TopScView alloc]initWithFrame:CGRectMake(0, 0,self.frame.size.width ,70 *kScreenHeight)];
    
    self.top.dataArr = @[@"我的问题",@"热门问题"].mutableCopy;
    self.top.delegate = self;
    [self addSubview:self.top];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.itemSize = CGSizeMake(self.frame.size.width, self.frame.size.height - 70 *kScreenHeight);
    flow.minimumLineSpacing = 0;
    flow.minimumInteritemSpacing = 0;
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 70 *kScreenHeight, self.frame.size.width, self.frame.size.height - 70 *kScreenHeight) collectionViewLayout:flow];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.pagingEnabled = YES;
    [self addSubview:_collectionView];
    _collectionView.bounces = NO;
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *arr = @[[UIColor whiteColor], [UIColor whiteColor]];
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = arr[indexPath.row];
    return cell;
}

- (void)PassOriginWithX:(CGFloat)x
{
    [_collectionView setContentOffset:CGPointMake(x, 0) animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"%f", scrollView.contentOffset.x);
    // 把collectionView的位移传入TopScView中
    if([UIScreen mainScreen].bounds.size.width != 320)
    {
        [self.top changeContentOffsetWithH:(_collectionView.contentOffset.x + 82 )]
        ;
    }
    else{
        [self.top changeContentOffsetWithH:(_collectionView.contentOffset.x + 75 )];
        
    }
    
}
-(void)creatTable
{
    self.tableView  = [[UITableView alloc] initWithFrame:CGRectMake(0, 0*kScreenHeight, self.frame.size.width,self.frame.size.height -134 *kScreenHeight-64) style:UITableViewStylePlain];
    [self.collectionView addSubview:_tableView];
    
    self.tableView1  = [[UITableView alloc] initWithFrame:CGRectMake(720  * kScreenWidth, 0, self.frame.size.width,self.frame.size.height -134 *kScreenHeight-64) style:UITableViewStylePlain];
    [self.collectionView addSubview:_tableView1];
    self.tableView.backgroundColor = kHexColor(0xeeeeee);
    self.tableView1.backgroundColor = kHexColor(0xeeeeee);

    UIView *foot =[[ UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 600*kScreenHeight)];
    foot.backgroundColor = kHexColor(0xeeeeee);
    self.tableView.tableFooterView = foot;
    UIView *foot1 =[[ UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 600*kScreenHeight)];
    foot1.backgroundColor = kHexColor(0xeeeeee);
    self.tableView1.tableFooterView = foot1;
    self.tiwenBtn = [ UIButton buttonWithType:UIButtonTypeCustom];
    [foot addSubview:_tiwenBtn];
    [_tiwenBtn setImage:[UIImage imageNamed:@"提问@3x"] forState:UIControlStateNormal ];
    _tiwenBtn.sd_layout
    .topSpaceToView(foot,100 *kScreenHeight)
    .leftSpaceToView(foot,-150 *kScreenWidth)
    .widthIs(1020 *kScreenWidth)
    .heightIs(111*kScreenHeight);

}

@end
