//
//  AQILocationManager.m
//  AQISH
//
//  Created by xiebohui on 8/12/15.
//  Copyright (c) 2015 xiebohui. All rights reserved.
//

#import "AQILocationManager.h"

@interface AQILocationManager() <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation AQILocationManager

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static AQILocationManager *sharedManager;
    dispatch_once(&onceToken, ^{
        sharedManager = [AQILocationManager new];
    });
    return sharedManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0") && [CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
            [_locationManager requestWhenInUseAuthorization];
        }
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        [self.locationManager startUpdatingLocation];
    }
    return self;
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    self.currentLocation = [locations lastObject];
}

@end
