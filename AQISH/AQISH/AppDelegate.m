//
//  AppDelegate.m
//  AQISH
//
//  Created by xiebohui on 8/8/15.
//  Copyright (c) 2015 xiebohui. All rights reserved.
//

#import "AppDelegate.h"
#import "AQILocationManager.h"
#import "AQIMainViewController.h"
#import "MMDrawerController.h"
#import "AQIMenuViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) UINavigationController *mainViewController;
@property (nonatomic, strong) UINavigationController *menuViewController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [AQILocationManager sharedManager];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.mainViewController = [[UINavigationController alloc] initWithRootViewController:[AQIMainViewController new]];
    self.menuViewController = [[UINavigationController alloc] initWithRootViewController:[AQIMenuViewController new]];
    MMDrawerController *drawerController = [[MMDrawerController alloc] initWithCenterViewController:self.mainViewController leftDrawerViewController:self.menuViewController];
    self.window.rootViewController = drawerController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
