//
//  ListData.h
//  iSport
//
//  Created by YoungShook on 13-7-21.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListData : NSObject
+(NSMutableArray*)allListData;
+(NSMutableArray*)sortListData:(int)sort;
@end
