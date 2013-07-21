//
//  RightViewC.m
//  iSport
//
//  Created by YoungShook on 13-7-20.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import "RightViewC.h"
#import "sportMessage.h"
#import "CalloutMapAnnotation.h"
#import "CustomPointAnnotation.h"
#import "CallOutAnnotationView.h"
#import "sportMessage.h"
@interface RightViewC (){
    CalloutMapAnnotation *_calloutMapAnnotation;
}
@end

@implementation RightViewC
@synthesize mapView = _mapView;
@synthesize sportMsg;
@synthesize annotations;
@synthesize theAnnotation;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
}
-(void)viewWillDisappear:(BOOL)animated
{
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    [_mapView setShowsUserLocation:YES];
    _mapView.delegate = self;
    self.view = _mapView;
    sportMsg =[[NSMutableArray arrayWithArray: [ListData allListData]]copy];
    // 添加PointAnnotations
    for (sportMessage* sport in sportMsg) {
            
            //添加自定义Annotation
            CLLocationCoordinate2D center = {sport.latitude,sport.longitude};
            
            CustomPointAnnotation *pointAnnotation = [[CustomPointAnnotation alloc] init];
        NSString *type = nil;
        switch (sport.ballType) {
            case kBasketball:
                type = [NSString stringWithFormat:@"basketball"];
                break;
            case kFootball:
                type = [NSString stringWithFormat:@"football"];;
                break;
            case kBadminton:
                type = [NSString stringWithFormat:@"badminton"];;
                break;
            case kTennisBall:
               type = [NSString stringWithFormat:@"tennisball"];;
                break;
            case kPingpong:
                type = [NSString stringWithFormat:@"pingpong"];;
                break;
            default:
                break;
        }

        
            NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%@",sport.message],@"消息",[NSString stringWithFormat:@"%@",sport.endTimeDate],@"结束时间",type,@"类型", nil];
            pointAnnotation.pointCalloutInfo =dict;
            
            pointAnnotation.coordinate = center;
            [_mapView addAnnotation:pointAnnotation];
            [pointAnnotation release];
            
//            BMKCoordinateSpan span = {0.06,0.03};
//            BMKCoordinateRegion region = {center,span};
//            [_mapView setRegion:region animated:NO];      //  }
   }
	// Do any additional setup after loading the view.
}

#pragma mark BMapViewDelegate
/**
 *点中底图标注后会回调此接口
 *@param mapview 地图View
 *@param mapPoi 标注点信息
 */
- (void)mapView:(BMKMapView *)mapView onClickedMapPoi:(BMKMapPoi*)mapPoi
{
//    NSLog(@"%@",mapPoi.text);
}

// Override
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation
{
    static NSString *annotationIdentifier = @"customAnnotation";
    if ([annotation isKindOfClass:[CustomPointAnnotation class]]) {
        
        BMKPinAnnotationView *annotationview = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:annotationIdentifier];
        
        annotationview.image = [UIImage imageNamed:@"marker"];
        //[annotationview setPinColor:BMKPinAnnotationColorGreen];
        [annotationview setAnimatesDrop:YES];
        annotationview.canShowCallout = NO;
        
        return annotationview;
        
    }
    else if ([annotation isKindOfClass:[CalloutMapAnnotation class]]){
        
        //如果可以重用
        CallOutAnnotationView *calloutannotationview = (CallOutAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"calloutview"];
        
        //否则创建新的calloutView
        if (!calloutannotationview) {
            calloutannotationview = [[[CallOutAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"calloutview"] autorelease];
            
            SportPointCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"SportPointCell" owner:self options:nil] objectAtIndex:0];
            
            [calloutannotationview.contentView addSubview:cell];
            calloutannotationview.sportInfoView = cell;
        }
        
        //开始设置添加marker时的赋值
        //calloutannotationview.sportInfoView.aliasLabel.text = [ann.locationInfo objectForKey:@"alias"];
        calloutannotationview.sportInfoView.speedLabel.text = @"2013-7-21 上午10:22:10";
        //calloutannotationview.sportInfoView.degreeLabel.text =[ann.locationInfo objectForKey:@"degree"];
        calloutannotationview.sportInfoView.nameLabel.text =  @"晚上打球,求组队!";
        calloutannotationview.sportInfoView.image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"basketball"]];
        return calloutannotationview;
        
        
    }
    
    return nil;
}

// Override
- (void)mapView:(BMKMapView *)mapView annotationViewForBubble:(BMKAnnotationView *)view;
{
//    NSLog(@"paopaoclick");
}

/**
 *当选中一个annotation views时，调用此接口
 *@param mapView 地图View
 *@param views 选中的annotation views
 */
- (void)mapView:(BMKMapView *)mapView didSelectAnnotationView:(BMKAnnotationView *)view
{
//    NSLog(@"didSelectAnnotationView");
    //CustomPointAnnotation 是自定义的marker标注点，通过这个来得到添加marker时设置的pointCalloutInfo属性
    CustomPointAnnotation *annn = (CustomPointAnnotation*)view.annotation;
    
    
    if ([view.annotation isKindOfClass:[CustomPointAnnotation class]]) {
        
        //如果点到了这个marker点，什么也不做
        if (_calloutMapAnnotation.coordinate.latitude == view.annotation.coordinate.latitude&&
            _calloutMapAnnotation.coordinate.longitude == view.annotation.coordinate.longitude) {
            return;
        }
        //如果当前显示着calloutview，又触发了select方法，删除这个calloutview annotation
        if (_calloutMapAnnotation) {
            [mapView removeAnnotation:_calloutMapAnnotation];
            _calloutMapAnnotation=nil;
            
        }
        //创建搭载自定义calloutview的annotation
        _calloutMapAnnotation = [[[CalloutMapAnnotation alloc] initWithLatitude:view.annotation.coordinate.latitude andLongitude:view.annotation.coordinate.longitude] autorelease];
        
        //把通过marker(ZNBCPointAnnotation)设置的pointCalloutInfo信息赋值给CalloutMapAnnotation
        _calloutMapAnnotation.locationInfo = annn.pointCalloutInfo;
        
        [mapView addAnnotation:_calloutMapAnnotation];
        
        
        
        [mapView setCenterCoordinate:view.annotation.coordinate animated:YES];
        
    }
}

//-(void)mapView:(BMKMapView *)mapView didDeselectAnnotationView:(BMKAnnotationView *)view{
//    
//    if (_calloutMapAnnotation&&![view isKindOfClass:[CallOutAnnotationView class]]) {
//        
//        if (_calloutMapAnnotation.coordinate.latitude == view.annotation.coordinate.latitude&&
//            _calloutMapAnnotation.coordinate.longitude == view.annotation.coordinate.longitude) {
//            [mapView removeAnnotation:_calloutMapAnnotation];
//            _calloutMapAnnotation = nil;
//        }
//    }
//}


@end
