//
//  sportMessage.h
//  iSport
//
//  Created by YoungShook on 13-7-20.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    kBasketball = 0,
    kFootball,
    kBadminton,
    kTennisBall,
    kPingpong,
}kBallType;

@interface sportMessage : NSObject
@property(nonatomic,copy) NSString *ID;   //消息ID
@property(nonatomic,copy) NSString *message;   //消息内容 0
@property(nonatomic,copy) NSDate *pubTimeDate;    //发布时间
@property(nonatomic,copy) NSString *pubTimeStr; //发布时间 例如:36分钟前
@property(nonatomic,copy) NSDate *endTimeDate;    //活动结束时间 0
@property(nonatomic,copy) NSString *endTimeDataStr; //距离结束时间 例如:1小时40分钟后
@property(nonatomic,copy) NSString *headImage;  //用户头像 
@property(nonatomic,assign) double longitude;  //经度 
@property(nonatomic,assign) double latitude;  //纬度
@property(nonatomic,assign) BOOL  isCharge;  //是否AA 0
@property(nonatomic,assign) kBallType ballType;  //运动类型
@end
