//
//  TimeTypeCell.h
//  iSport
//
//  Created by Edward on 13-7-21.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeTypeCell : UITableViewCell

- (void)bindTitle:(NSString *)title timeStr:(NSString *)timeStr;

- (void)bindWithObject:(id)object;

@end
