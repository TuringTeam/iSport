//
//  DetailTypeCell.m
//  iSport
//
//  Created by Edward on 13-7-21.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import "DetailTypeCell.h"

@interface DetailTypeCell ()

@end

@implementation DetailTypeCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

- (void)bindTitle:(NSString *)title detail:(NSString *)detail
{
	[self.textLabel setText:title];
  [self.detailTextLabel setText:detail];
}

- (void)layoutSubviews
{
	[super layoutSubviews];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
