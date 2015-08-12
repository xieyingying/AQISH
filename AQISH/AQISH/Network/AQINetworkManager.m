//
//  AQINetworkManager.m
//  AQISH
//
//  Created by xiebohui on 8/12/15.
//  Copyright (c) 2015 xiebohui. All rights reserved.
//

#import "AQINetworkManager.h"

@implementation AQINetworkManager

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static AQINetworkManager *sharedManager;
    dispatch_once(&onceToken, ^{
        sharedManager = [AQINetworkManager new];
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
