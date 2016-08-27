//
//  BaseViewController.m
//  PMSC
//
//  Created by 李锐 on 16/8/22.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.navigationController .navigationBar.translucent = NO;
    
    self.navigationController.navigationBar.barTintColor =  kAppColor;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:32 *kScreenWidth],NSForegroundColorAttributeName:[UIColor whiteColor]}];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    NSArray *viewControllers = [NSArray arrayWithArray:self.navigationController.viewControllers];
    if (viewControllers.count != 0)
    {
        UIViewController *firstVC = [self.navigationController.viewControllers objectAtIndex:0];
        
        if (self == firstVC)
        {
            self.navigationItem.leftBarButtonItem = nil;
            self.tabBarController.tabBar.hidden = NO;

        }
        else
        {
           self.tabBarController.tabBar.hidden = YES;
        }
    }
}

-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
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
