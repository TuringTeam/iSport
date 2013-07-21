//
//  TimeTypeCell.m
//  iSport
//
//  Created by Edward on 13-7-21.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import "TimeTypeCell.h"
#import "UIView+Frame.h"


@interface TimeTypeCell ()
@property (nonatomic, strong) UILabel *headerLabel;
@property (nonatomic, strong) UILabel *rightLabel;

@end

@implementation TimeTypeCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    self.headerLabel = [[UILabel alloc] init];
    [self.headerLabel setFont:[UIFont systemFontOfSize:15.0f]];
    [self.headerLabel setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:_headerLabel];
    
    self.rightLabel = [[UILabel alloc] init];
    [_rightLabel setTextColor:[UIColor grayColor]];
    [_rightLabel setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:_rightLabel];
    
  }
  return self;
}

- (void)bindTitle:(NSString *)title timeStr:(NSString *)timeStr
{
	[self.headerLabel setText:nil];
  [self.rightLabel setText:nil];
  
  [self.headerLabel setText:title];
  [self.rightLabel setText:timeStr];
}

- (void)layoutSubviews
{
	[super layoutSubviews];
  [self.headerLabel setX:10];
  [self.headerLabel setY:10];
  [self.headerLabel sizeToFit];
  
  [self.rightLabel sizeToFit];
  CGFloat rightLabelOriginX = 320	-	[self.rightLabel width] - 30;
  [self.rightLabel setX:rightLabelOriginX];
  [self.rightLabel setY:10];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
  [super setSelected:selected animated:animated];
  
  // Configure the view for the selected state
}

@end
