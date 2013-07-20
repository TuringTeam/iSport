//
//  CallOutAnnotationView.h
//  iSport
//
//  Created by Felix_Y on 13-7-20.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import "BMKAnnotationView.h" 
#import "SportPointCell.h"  
@interface CallOutAnnotationView : BMKAnnotationView
@property(nonatomic,retain) UIView *contentView;  //添加一个UIView
@property(nonatomic,retain) SportPointCell *sportInfoView;//在创建calloutView Annotation时，把contentView add的 subview赋值给businfoView
@end
