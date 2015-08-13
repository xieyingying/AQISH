//
//  AQIModels.h
//  AQISH
//
//  Created by xiebohui on 8/13/15.
//  Copyright (c) 2015 xiebohui. All rights reserved.
//

#import "MTLModel.h"

@interface AQISiteDataModel : MTLModel

@property (nonatomic, copy) NSString *stationID;
@property (nonatomic, copy) NSString *stationName;
@property (nonatomic, copy) NSString *groupParentID;
@property (nonatomic, assign) BOOL isGroup;
@property (nonatomic, assign) CGFloat longitude;
@property (nonatomic, assign) CGFloat latitude;

@end
