//
//  UINavigationBar+CustomNavBarColor.m
//  iSport
//
//  Created by Edward on 13-7-20.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import "UINavigationBar+CustomNavBarColor.h"

@implementation UINavigationBar (CustomNavBarColor)

- (void)setBarColor:(UIColor *)navBarColor
{
  UIColor *color = [UIColor colorWithRed:0.361 green:0.573 blue:0.573 alpha:1.000];
	[self setTintColor:color];
}

@end
