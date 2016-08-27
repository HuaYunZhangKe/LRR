//
//  BaseTabBarViewController.m
//  PMSC
//
//  Created by 李锐 on 16/8/23.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "BaseTabBarViewController.h"
@interface BaseTabBarViewController ()

@end

@implementation BaseTabBarViewController
/*** 第一个navigation */
-(BaseNaviViewController *)saiMaVC
{
    if(!_saiMaVC)
    {
        SaimaViewController *saima = [[SaimaViewController alloc] init];
        _saiMaVC =[[BaseNaviViewController alloc] initWithRootViewController:saima];
        
    }
    return _saiMaVC;
}
-(BaseNaviViewController*)shopVC
{
    if(!_shopVC)
    {
        ShopViewController *shop =[[ ShopViewController alloc] init];
        self.shopVC = [[BaseNaviViewController alloc] initWithRootViewController:shop];
        
    }
    return _shopVC;
}
-(BaseNaviViewController*)findVC
{
    if(!_findVC)
    {
        FindViewController *find =[[ FindViewController alloc] init];
        _findVC = [[BaseNaviViewController alloc] initWithRootViewController:find];
        
    }
    return _findVC;
}
-(BaseNaviViewController*)myVC
{
    if(!_myVC)
    {
        MyViewController *my =[[ MyViewController alloc] init];
        self.myVC = [[BaseNaviViewController alloc] initWithRootViewController:my];
        
    }
    return _myVC;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   
    
    self.saiMaVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"" image:[UIImage imageNamed:@"赛马"] selectedImage:[UIImage imageNamed:@"赛马"]];
    
  
    self.myVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"" image:[UIImage imageNamed:@"我的"] selectedImage:[UIImage imageNamed:@"r_nav_mine_focus_ios"]];
    
   
    self.shopVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"" image:[UIImage imageNamed:@"商城"] selectedImage:[UIImage imageNamed:@"r_nav_wwcdd_focus_ios"]];
    self.findVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"" image:[UIImage imageNamed:@"发现"] selectedImage:[UIImage imageNamed:@"r_nav_wwcdd_focus_ios"]];
    self.tabBar.tintColor = kAppColor;
    self.viewControllers = @[self.saiMaVC,self.shopVC,self.findVC, self.myVC];

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
