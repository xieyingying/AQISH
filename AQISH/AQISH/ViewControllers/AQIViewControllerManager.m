//
//  AQIViewControllerManager.m
//  AQISH
//
//  Created by xiebohui on 8/13/15.
//  Copyright (c) 2015 xiebohui. All rights reserved.
//

#import "AQIViewControllerManager.h"

@implementation AQIViewControllerManager

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static AQIViewControllerManager *sharedManager;
    dispatch_once(&onceToken, ^{
        sharedManager = [AQIViewControllerManager new];
    });
    return sharedManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

@end
