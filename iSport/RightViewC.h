//
//  RightViewC.h
//  iSport
//
//  Created by YoungShook on 13-7-20.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"
#import "LeftViewC.h"
#import "CenterViewC.h"
#import "BMapKit.h"

@interface RightViewC : UIViewController<BMKMapViewDelegate,BMKAnnotation>
@property(nonatomic ,retain) BMKMapView* mapView;
@property(nonatomic ,retain) BMKPointAnnotation* theAnnotation;
@end
