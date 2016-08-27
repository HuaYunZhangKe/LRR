
//
//  HelpViewController.m
//  PMSC
//
//  Created by 李锐 on 16/8/23.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "HelpViewController.h"
#import "HelpView.h"
@interface HelpViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain)HelpView *helpView;
@end

@implementation HelpViewController

-(HelpView *)helpView
{
    if (!_helpView) {
        _helpView = [[HelpView alloc] initWithFrame:self.view.bounds];
    }
    return _helpView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"帮助";
    [self.view addSubview:self.helpView];
    _helpView.tableView.delegate= self;
    _helpView.tableView.dataSource =self;
    _helpView.tableView1.delegate = self;
    _helpView.tableView1.dataSource = self;
    [_helpView.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [_helpView.tableView1 registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell1"];
}

-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == _helpView.tableView)
    {
        UITableViewCell *cell = [tableView  dequeueReusableCellWithIdentifier:@"cell"];
        cell.textLabel.text = @"qqqq";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;

    }
    else
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        cell.textLabel.text = @"qwrtgb";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

        return cell;

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
