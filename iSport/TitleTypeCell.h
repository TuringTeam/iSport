//
//  TitleTypeCell.h
//  iSport
//
//  Created by Edward on 13-7-21.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleTypeCell : UITableViewCell

- (void)bindTitle:(NSString *)title;

+ (CGFloat)RowHightWithObject:(NSString *)object;

@end
