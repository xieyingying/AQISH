//
//  AQIMenuViewController.m
//  AQISH
//
//  Created by xiebohui on 8/10/15.
//  Copyright (c) 2015 xiebohui. All rights reserved.
//

#import "AQIMenuViewController.h"
#import "AQIViewControllerManager.h"

@interface AQIMenuViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation AQIMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)commonInit {
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
}

#pragma mark - UITableViewDataSource && UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AQIMenuCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AQIMenuCell"];
    }
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"管理站点";
            break;
        case 1:
            cell.textLabel.text = @"标准说明";
            break;
        case 2:
            cell.textLabel.text = @"地图";
            break;
        case 3:
            cell.textLabel.text = @"关于";
            break;
        default:
            break;
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 3) {
        [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
            self.mm_drawerController.centerViewController = [AQIViewControllerManager sharedManager].aboutViewController;
        }];
    }
}

@end
