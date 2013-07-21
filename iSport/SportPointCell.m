//
//  SportPointCell.m
//  iSport
//
//  Created by Felix_Y on 13-7-20.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import "SportPointCell.h"  
@implementation SportPointCell
@synthesize nameLabel,speedLabel;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {  }
    return self;
}

- (void)dealloc
{

    [speedLabel release];

    [nameLabel release];
    [_image release];
    [super dealloc];
}
@end
