//
//  CalloutMapAnnotation.h
//  iSport
//
//  Created by Felix_Y on 13-7-20.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import <Foundation/Foundation.h> 
#import "BMapKit.h"  
@interface CalloutMapAnnotation : NSObject<BMKAnnotation>
@property (nonatomic) CLLocationDegrees latitude;
@property (nonatomic) CLLocationDegrees longitude;
@property(retain,nonatomic) NSDictionary *locationInfo;//callout吹出框要显示的各信息
- (id)initWithLatitude:(CLLocationDegrees)lat andLongitude:(CLLocationDegrees)lon;

@end
