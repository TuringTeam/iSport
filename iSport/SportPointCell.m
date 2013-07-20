//
//  SportPointCell.m
//  iSport
//
//  Created by Felix_Y on 13-7-20.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import "SportPointCell.h"  
@implementation SportPointCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {  }
    return self;
}

- (void)dealloc
{
    [_aliasLabel release];
    [_speedLabel release];
    [_degreeLabel release];
    [_nameLabel release];
    [super dealloc];
}
@end
