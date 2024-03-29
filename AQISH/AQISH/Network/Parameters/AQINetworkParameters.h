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
@property (nonatomic, assign) CGFloat lat;
@property (nonatomic, assign) CGFloat lng;
@property (nonatomic, copy) NSString *IMEI;

@end

@interface AQIForecastParameters : MTLModel

@property (nonatomic, copy) NSString *provider;
@property (nonatomic, copy) NSString *method;
@property (nonatomic, assign) CGFloat lat;
@property (nonatomic, assign) CGFloat lng;
@property (nonatomic, copy) NSString *IMEI;
@property (nonatomic, copy) NSString *groupID;

@end

@interface AQIBasicSiteDataParameters : MTLModel

@property (nonatomic, copy) NSString *provider;
@property (nonatomic, copy) NSString *method;
@property (nonatomic, assign) CGFloat lat;
@property (nonatomic, assign) CGFloat lng;
@property (nonatomic, copy) NSString *IMEI;
@property (nonatomic, copy) NSString *groupIDs;
@property (nonatomic, copy) NSString *siteIDs;

@end
