//
//  AQIViewControllerManager.h
//  AQISH
//
//  Created by xiebohui on 8/13/15.
//  Copyright (c) 2015 xiebohui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AQIViewControllerManager : NSObject

@property (nonatomic, strong) UINavigationController *aboutViewController;
@property (nonatomic, strong) UINavigationController *mapViewController;
@property (nonatomic, strong) UINavigationController *standardViewController;
@property (nonatomic, strong) UINavigationController *mainViewController;

+ (instancetype)sharedManager;

@end
