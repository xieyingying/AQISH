//
//  AQILocationManager.m
//  AQISH
//
//  Created by xiebohui on 8/12/15.
//  Copyright (c) 2015 xiebohui. All rights reserved.
//

#import "AQILocationManager.h"

@implementation AQILocationManager

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static AQILocationManager *sharedManager;
    dispatch_once(&onceToken, ^{
        sharedManager = [AQILocationManager new];
    });
    return sharedManager;
}

@end
