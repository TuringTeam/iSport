//
//  RightViewC.h
//  iSport
//
//  Created by YoungShook on 13-7-20.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h"
@interface RightViewC : UIViewController<BMKMapViewDelegate>
@property(nonatomic ,retain) BMKMapView* mapView;
@end
