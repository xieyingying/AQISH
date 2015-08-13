//
//  AQINetworkManager.h
//  AQISH
//
//  Created by xiebohui on 8/12/15.
//  Copyright (c) 2015 xiebohui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AQINetworkParameters.h"

@interface AQINetworkManager : NSObject

+ (instancetype)sharedManager;

- (RACSignal *)requestAlertDataByParameters:(AQIAlertParameters *)parameters;
- (RACSignal *)requestForecastDataByParameters:(AQIForecastParameters *)parameters;
- (RACSignal *)requestBasicSiteDataByParameters:(AQIBasicSiteDataParameters *)parameters;

@end
