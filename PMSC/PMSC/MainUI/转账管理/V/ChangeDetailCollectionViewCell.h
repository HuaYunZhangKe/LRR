//
//  ChangeDetailCollectionViewCell.h
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangeDetailCollectionViewCell : UICollectionViewCell<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,retain)UITableView *tableView;
@property(nonatomic,assign)NSInteger type;

@end
