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

@end
