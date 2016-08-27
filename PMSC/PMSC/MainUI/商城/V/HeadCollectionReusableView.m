//
//  HeadCollectionReusableView.m
//  PMSC
//
//  Created by 李锐 on 16/8/20.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "HeadCollectionReusableView.h"
#import "headCollectionViewCell.h"
@interface HeadCollectionReusableView ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,retain)NSArray *arr;
@end
@implementation HeadCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kHexColor(0xeeeeee);
        [self createBasicView];
        self.arr = @[@"图标 (1)",@"图标 (2)",@"图标 (3)",@"图标 (4)",@"图标 (5)",@"图标 (6)",@"图标 (7)"];
        [self creatLunbo];

      
}
    return self;
}
-(void)createBasicView{

    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.itemSize = CGSizeMake(self.frame.size.width /4 - 2,189 *kScreenHeight);
    flow.minimumLineSpacing = 2;
    flow.minimumInteritemSpacing = 2;
    flow.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.kindCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 336*kScreenHeight, self.frame.size.width, 378*kScreenHeight) collectionViewLayout:flow];
    _kindCollectionView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_kindCollectionView];
    [_kindCollectionView registerClass:[headCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    _kindCollectionView.delegate =self;
    _kindCollectionView.dataSource = self;
    _kindCollectionView.scrollEnabled = NO;
    
    UIView*bgView =[UIView new];
    [self addSubview:bgView];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView .sd_layout
    .topSpaceToView(_kindCollectionView,0.5)
    .leftSpaceToView(self,0)
    .rightSpaceToView(self,0)
    .heightIs(78 *kScreenHeight);
    
    UIView *bgView1 = [UIView new];
    [self addSubview:bgView1];
    bgView1.backgroundColor = [UIColor whiteColor];
    bgView1.sd_layout
    .topSpaceToView(bgView,12 *kScreenHeight)
    .leftEqualToView(bgView)
    .rightEqualToView(bgView)
    .heightIs(80*kScreenHeight);
    
    UILabel *label = [UILabel new];
    label.text = @"获奖信息";
    [self addSubview:label];
    label.sd_layout
    .topSpaceToView(_kindCollectionView,0.5)
    .leftSpaceToView(self,18*kScreenWidth)
    .widthIs(142*kScreenWidth)
    .heightIs(78 *kScreenHeight);
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(label.right+20*kScreenWidth, label.top, 0.5, label.height)];
    [bgView addSubview:line];
    line.backgroundColor = kHexColor(0xeeeeee);
    self.messageLabel = [UILabel new];
    [self addSubview:_messageLabel];
    _messageLabel.sd_layout
    .topEqualToView(label)
    .leftSpaceToView(line,23*kScreenWidth)
    .widthIs(573*kScreenWidth)
    .heightIs(label.height);
    UILabel *label1 =[ UILabel new];
    [self addSubview:label1];
    label1.sd_layout
    .topSpaceToView(bgView,12*kScreenHeight)
    .leftSpaceToView(self,18*kScreenHeight)
    .widthIs(label.width)
    .heightIs(bgView1.height);
    label1.text= @"热门商品";
    _messageLabel.text = @"恭喜xxxx获得详细信息第一名";
    self.arrow= [UIButton buttonWithType:UIButtonTypeCustom];
    [bgView1 addSubview:_arrow];
    _arrow.frame = CGRectMake(683*kScreenWidth, 23*kScreenHeight, 19*kScreenHeight, 33*kScreenHeight);
    [_arrow setImage:[UIImage imageNamed:@"箭头"] forState:0];
    
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _arr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    headCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.imgView.image = [UIImage imageNamed:_arr[indexPath.row]];
    
    return cell;
}
-(void)creatLunbo
{
    self.xlCycleScrollView = [XLCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.frame.size.width, 336 *kScreenHeight) delegate:self placeholderImage:[UIImage imageNamed:@"zwt3"]];
    self.xlCycleScrollView.pageControlAliment = XLCyclesScrollViewPageContolAlimentCenter;
    self.xlCycleScrollView.currentPageDotColor = [UIColor redColor];
    self.xlCycleScrollView.pageDotColor = kHexColor(0xeeeeee);
    self.xlCycleScrollView.backgroundColor = [UIColor greenColor];
    self.xlCycleScrollView.imageURLStringsGroup = _arr;
    [self addSubview:self.xlCycleScrollView];
    
   
}
- (void)cycleScrollView:(XLCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    self.click(index);
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.click(indexPath.item);
}
@end
