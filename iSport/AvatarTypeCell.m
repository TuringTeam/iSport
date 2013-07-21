//
//  AvatarTypeCell.m
//  iSport
//
//  Created by Edward on 13-7-21.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import "AvatarTypeCell.h"
#import "UIView+Frame.h"

@interface AvatarTypeCell ()

@property (nonatomic, strong) UIImageView *avatar;
@property (nonatomic, strong) UILabel *messageLabel;

@end

@implementation AvatarTypeCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    self.avatar = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 35, 35)];
    [[self.avatar layer] setCornerRadius:3.0f];
    [[self.avatar layer] setMasksToBounds:YES];
    [self.contentView addSubview:self.avatar];
    
    self.messageLabel = [[UILabel alloc] init];
    [self.messageLabel setNumberOfLines:1];
    [self.messageLabel setFont:[UIFont systemFontOfSize:15.0f]];
    [self.messageLabel setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:self.messageLabel];
  }
  return self;
}

- (void)bindAvatarImage:(NSString *)avatarImage message:(NSString *)message
{
	
  [self.avatar setImage:nil];
  [self.messageLabel setText:nil];
  
  [self.avatar setImage:[UIImage imageNamed:@""]];
  [self.messageLabel setText:message];
  
  
}

- (void)layoutSubviews
{
	[super layoutSubviews];
  [self sizeToFit];
  CGFloat messageLabelOriginX = [self.avatar right];
  [self.messageLabel sizeToFit];
  [self.messageLabel setX:messageLabelOriginX + 10];
  [self.messageLabel setY:10];
  
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
  [super setSelected:selected animated:animated];
  
  // Configure the view for the selected state
}

@end
