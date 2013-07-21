//
//  TitleTypeCell.m
//  iSport
//
//  Created by Edward on 13-7-21.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import "TitleTypeCell.h"
#import "UIView+Frame.h"

@interface TitleTypeCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation TitleTypeCell
@synthesize titleLabel = titleLabel_;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
      
      
      self.titleLabel = [[UILabel alloc] init];
      [self.titleLabel setLineBreakMode:NSLineBreakByWordWrapping];
      [self.titleLabel setNumberOfLines:0];
      [self.titleLabel setFont:[UIFont boldSystemFontOfSize:14.0f]];
      [self.titleLabel setBackgroundColor:[UIColor clearColor]];
      [self.titleLabel setBackgroundColor:[UIColor clearColor]];
      [self.titleLabel setTextColor:[UIColor grayColor]];
      [self.contentView addSubview:titleLabel_];
      
      
    }
    return self;
}

- (void)bindTitle:(NSString *)title
{
	[self.titleLabel setText:nil];
  [self.titleLabel setText:title];
  
}

- (void)layoutSubviews
{
	[super layoutSubviews];
  [self.titleLabel setOrigin:CGPointMake(10, 10)];
  
  CGSize size = [self.titleLabel.text sizeWithFont:self.titleLabel.font constrainedToSize:CGSizeMake(280, MAXFLOAT) lineBreakMode:self.titleLabel.lineBreakMode];
  [self.titleLabel setSize:size];
  
  [self.titleLabel sizeToFit];
}

+ (CGFloat)RowHightWithObject:(NSString *)object
{
  CGSize size = [object sizeWithFont:[UIFont boldSystemFontOfSize:14.0f] constrainedToSize:CGSizeMake(280, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
  return size.height + 20;
}

- (CGSize)sizeThatFits:(CGSize)size
{
	CGSize rowsize = [self.titleLabel.text sizeWithFont:self.titleLabel.font constrainedToSize:CGSizeMake(300, MAXFLOAT) lineBreakMode:self.titleLabel.lineBreakMode];
  CGFloat height = rowsize.height + 20;
  
  return CGSizeMake(self.size.width, height);
  
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
