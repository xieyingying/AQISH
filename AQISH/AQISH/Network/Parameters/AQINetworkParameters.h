//
//  AQINetworkParameters.h
//  AQISH
//
//  Created by xiebohui on 8/12/15.
//  Copyright (c) 2015 xiebohui. All rights reserved.
//

#import "MTLModel.h"

@interface AQIAlertParameters : MTLModel

@property (nonatomic, copy) NSString *provider;
@property (nonatomic, copy) NSString *method;
@property (nonatomic, copy) NSString *lat;
@property (nonatomic, copy) NSString *lng;
@property (nonatomic, copy) NSString *IMEI;

@end
