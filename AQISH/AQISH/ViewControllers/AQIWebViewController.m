//
//  AQIWebViewController.m
//  AQISH
//
//  Created by xiebohui on 8/13/15.
//  Copyright (c) 2015 xiebohui. All rights reserved.
//

#import "AQIWebViewController.h"

@interface AQIWebViewController ()

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation AQIWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)commonInit {
    UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [menuButton setImage:[UIImage imageNamed:@"Icon_Menu"] forState:UIControlStateNormal];
    menuButton.frame = CGRectMake(0, 0, 20, 20);
    [menuButton addTarget:self action:@selector(showMenu:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
    
    _webView = [[UIWebView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:_webView];
    [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    NSError *error = nil;
    NSString *page = [[NSBundle mainBundle] pathForResource:self.HTML ofType:@"html"];
    NSString *pageSource = [NSString stringWithContentsOfFile:page encoding:NSUTF8StringEncoding error:&error];
    [self.webView loadHTMLString:pageSource baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];
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
