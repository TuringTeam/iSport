//
//  CenterViewCell.h
//  iSport
//
//  Created by Edward on 13-7-20.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CellDefaultHeight				77

@interface CenterViewCell : UITableViewCell

- (void)bindCellObject:(id)object;

- (void)setDistanceLabelText:(NSString *)text;

@end
