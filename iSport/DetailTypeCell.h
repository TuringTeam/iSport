//
//  DetailTypeCell.h
//  iSport
//
//  Created by Edward on 13-7-21.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailTypeCell : UITableViewCell

- (void)bindTitle:(NSString *)title detail:(NSString *)detail;

- (void)bindWithObject:(id)object;

@end
