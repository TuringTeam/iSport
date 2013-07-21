//
//  ListData.m
//  iSport
//
//  Created by YoungShook on 13-7-21.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import "ListData.h"
#import "sportMessage.h"
@implementation ListData

+(NSMutableArray*)allListData{
    NSMutableArray *allData = [[NSMutableArray new]autorelease];
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"ModelTest" ofType:@"plist"];
    NSMutableArray *allArray = [[NSMutableArray alloc]initWithContentsOfFile:plistPath];
    
    [allArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        sportMessage *sportMsg = [sportMessage new];
        sportMsg.ID = [obj objectForKey:@"ID"];
        sportMsg.message = [obj objectForKey:@"message"];
        sportMsg.endTimeDate = [obj objectForKey:@"endTimeDate"];
        sportMsg.pubTimeDate = [obj objectForKey:@"pubTimeDate"];
        sportMsg.headImage = [obj objectForKey:@"headImage"];
        sportMsg.longitude = [[obj objectForKey:@"longitude"]doubleValue];
        sportMsg.latitude = [[obj objectForKey:@"latitude"]doubleValue];
        sportMsg.isCharge = [[obj objectForKey:@"isCharge"]boolValue];
        sportMsg.ballType = [[obj objectForKey:@"kBallType"]intValue];
        [allData addObject:sportMsg];
    }];
    
    return allData;
}

+(NSMutableArray*)sortListData:(int)sort{
    NSMutableArray *allData = [[NSMutableArray new]autorelease];
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"ModelTest" ofType:@"plist"];
    NSMutableArray *allArray = [[NSMutableArray alloc]initWithContentsOfFile:plistPath];
        [allArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if ([[obj objectForKey:@"kBallType"]intValue] == sort - 2) {
                sportMessage *sportMsg = [sportMessage new];
                sportMsg.ID = [obj objectForKey:@"ID"];
                sportMsg.message = [obj objectForKey:@"message"];
                sportMsg.endTimeDate = [obj objectForKey:@"endTimeDate"];
                sportMsg.pubTimeDate = [obj objectForKey:@"pubTimeDate"];
                sportMsg.headImage = [obj objectForKey:@"headImage"];
                sportMsg.longitude = [[obj objectForKey:@"longitude"]doubleValue];
                sportMsg.latitude = [[obj objectForKey:@"latitude"]doubleValue];
                sportMsg.isCharge = [[obj objectForKey:@"isCharge"]boolValue];
                sportMsg.ballType = [[obj objectForKey:@"kBallType"]intValue];
                [allData addObject:sportMsg];
            }
        }];
    return allData;
}
@end
