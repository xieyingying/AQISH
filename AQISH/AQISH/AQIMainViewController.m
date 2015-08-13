//
//  AQIMainViewController.m
//  AQISH
//
//  Created by xiebohui on 8/8/15.
//  Copyright (c) 2015 xiebohui. All rights reserved.
//

#import "AQIMainViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "AQINetworkManager.h"

@interface AQIMainViewController ()

@property (nonatomic, strong) UIImageView *backgroundView;

@end

@implementation AQIMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)commonInit {
    self.view.backgroundColor = [UIColor whiteColor];
    self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Background"]];
    [self.view addSubview:self.backgroundView];
    [self.backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [menuButton setImage:[UIImage imageNamed:@"Icon_Menu"] forState:UIControlStateNormal];
    menuButton.frame = CGRectMake(0, 0, 20, 20);
    [menuButton addTarget:self action:@selector(showMenu:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
    
    UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [shareButton setImage:[UIImage imageNamed:@"Icon_Share"] forState:UIControlStateNormal];
    shareButton.frame = CGRectMake(0, 0, 20, 20);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:shareButton];
    
    [[[AQINetworkManager sharedManager] requestAlertDataByParameters:[AQIAlertParameters new]] subscribeNext:^(id x) {
        
    } error:^(NSError *error) {
        
    }];
    
    [[[AQINetworkManager sharedManager] requestForecastDataByParameters:[AQIForecastParameters new]] subscribeNext:^(id x) {
        
    } error:^(NSError *error) {
        
    }];
    [[[AQINetworkManager sharedManager] requestBasicSiteDataByParameters:[AQIBasicSiteDataParameters new]] subscribeNext:^(id x) {
        
    } error:^(NSError *error) {
        
    }];
}

- (void)showMenu:(id)sender {
    if (self.mm_drawerController.openSide == MMDrawerSideLeft) {
        [self.mm_drawerController closeDrawerAnimated:YES completion:NULL];
    }
    else {
        [self.mm_drawerController openDrawerSide:MMDrawerSideLeft animated:YES completion:NULL];
    }
}

@end
