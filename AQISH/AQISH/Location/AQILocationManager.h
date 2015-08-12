//
//  AQILocationManager.h
//  AQISH
//
//  Created by xiebohui on 8/12/15.
//  Copyright (c) 2015 xiebohui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface AQILocationManager : NSObject

@property (nonatomic, strong) CLLocation *currentLocation;

+ (instancetype)sharedManager;

@end
