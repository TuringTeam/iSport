//
//  sportMessage.h
//  iSport
//
//  Created by YoungShook on 13-7-20.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface sportMessage : NSObject
@property(nonatomic,retain) NSString *ID;   //消息ID
@property(nonatomic,retain) NSString *message;   //消息内容
@property(nonatomic,retain) NSString *pubTimeDate;    //发布时间
@property(nonatomic,retain) NSString *pubTimeStr; //发布时间 例如:36分钟前
@property(nonatomic,retain) NSDate *endTimeDate;    //活动结束时间
@property(nonatomic,retain) NSString *endTimeDataStr; //距离结束时间 例如:1小时40分钟后
@property(nonatomic,retain) NSString *address;  //活动地址
@property(nonatomic,retain) NSString *remarks; //备注
@property(nonatomic,retain) UIImage *headImage;  //用户头像

@end
