//
//  ListTableView.m
//  iSport
//
//  Created by Edward on 13-7-20.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import "ListTableView.h"

@implementation ListTableView

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame style:UITableViewStylePlain];
  if (self) {
    [self setBackgroundView:nil];
    
    [self setBackgroundColor:[UIColor colorWithPatternImage:
                              [UIImage imageNamed:@"BackgroundTextures.png"]]];
  }
  return self;
}


@end
