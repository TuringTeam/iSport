//
//  sportMessage.m
//  iSport
//
//  Created by YoungShook on 13-7-20.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import "sportMessage.h"

@implementation sportMessage

-(id)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)updateTime{
    NSTimeInterval atime = [self.pubTimeDate timeIntervalSinceNow];
    int hour = (int)(atime/3600);
    int minute = (int)(atime-hour*3600)/60;
    if (hour == 0 ) {
        self.pubTimeStr = [NSString stringWithFormat:@"%d分钟前",minute];
        if (minute == 0) {
        self.pubTimeStr = [NSString stringWithFormat:@"1分钟前"];
        }
    }else{
        if (minute == 0) {
            self.pubTimeStr = [NSString stringWithFormat:@"%d小时前",hour];
        }
    }
    
    NSTimeInterval endTimer =[self.endTimeDate timeIntervalSinceNow];
    int endHour = (int)(endTimer/3600);
    int endMinute = (int)(endTimer-hour*3600)/60;
    if (endHour == 0) {
        self.endTimeDataStr = [NSString stringWithFormat:@"%d分钟后",endMinute];
        if (endMinute == 0) {
            self.endTimeDataStr = [NSString stringWithFormat:@"1分钟后"];
        }
    }else{
        if (endMinute == 0) {
            self.endTimeDataStr = [NSString stringWithFormat:@"%d小时后",endHour];
        }else{
            self.endTimeDataStr = [NSString stringWithFormat:@"%d小时%d分钟后",endHour,endMinute];
        }
    }
}

@end
