//
//  AppDelegate.h
//  iSport
//
//  Created by YoungShook on 13-7-20.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JASidePanelController;
@class BMKMapManager;
@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    BMKMapManager* _mapManager;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) JASidePanelController *viewController;
@end
