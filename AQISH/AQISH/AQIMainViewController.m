//
//  AQIMainViewController.m
//  AQISH
//
//  Created by xiebohui on 8/8/15.
//  Copyright (c) 2015 xiebohui. All rights reserved.
//

#import "AQIMainViewController.h"
#import "UIViewController+MMDrawerController.h"

@interface AQIMainViewController ()

@end

@implementation AQIMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)commonInit {
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [menuButton setImage:[UIImage imageNamed:@"Icon_Menu"] forState:UIControlStateNormal];
    menuButton.frame = CGRectMake(0, 0, 30, 30);
    [menuButton addTarget:self action:@selector(showMenu:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
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
