//
//  AQINetworkParameters.m
//  AQISH
//
//  Created by xiebohui on 8/12/15.
//  Copyright (c) 2015 xiebohui. All rights reserved.
//

#import "AQINetworkParameters.h"
#import <AdSupport/AdSupport.h>
#import "AQILocationManager.h"

@implementation AQIAlertParameters

- (instancetype)init
{
    self = [super init];
    if (self) {
        if ([AQILocationManager sharedManager].currentLocation) {
            _lat = [AQILocationManager sharedManager].currentLocation.coordinate.latitude;
            _lng = [AQILocationManager sharedManager].currentLocation.coordinate.longitude;
        }
        _lat = -1;
        _lng = -1;
        _provider = @"MMShareBLL.DAL.WebAQI.Iphone";
        _method = @"IphoneWarningTable";
        _IMEI = [ASIdentifierManager sharedManager].advertisingIdentifier.UUIDString;
    }
    return self;
}

@end
