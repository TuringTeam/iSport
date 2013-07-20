//
//  sportMessage.h
//  iSport
//
//  Created by YoungShook on 13-7-20.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface sportMessage : NSObject
@property(nonatomic,retain) NSString *ID;
@property(nonatomic,retain) NSString *title;
@property(nonatomic,retain) NSString *time;
@property(nonatomic,retain) NSString *address;
@property(nonatomic,retain) NSString *remarks; //备注
@property(nonatomic,retain) UIImage *headImage;

@end
