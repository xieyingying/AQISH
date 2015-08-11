//
//  AQIMenuViewController.m
//  AQISH
//
//  Created by xiebohui on 8/10/15.
//  Copyright (c) 2015 xiebohui. All rights reserved.
//

#import "AQIMenuViewController.h"

@interface AQIMenuViewController ()

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation AQIMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)commonInit {
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
}

@end
