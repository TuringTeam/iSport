//
//  CenterViewCell.m
//  iSport
//
//  Created by Edward on 13-7-20.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import "CenterViewCell.h"
#import "CHDraggableView+Avatar.h"

#define LabelColor   [UIColor colorWithRed:1.000 green:0.720 blue:0.340 alpha:1.000]

@interface CenterViewCell ()

@property (nonatomic, strong) UIImageView *avatarView;		//用户头像
@property (nonatomic, strong) UILabel *userLabel;					//用户名
@property (nonatomic, strong) UILabel *messageLabel;			//消息
@property (nonatomic, strong) UILabel *distanceLabel;			//距离
@property (nonatomic, strong) UILabel *publishTimeLabel;	//发布时间
@property (nonatomic, strong) UILabel *timeUpLabel;				//截至时间
@property (nonatomic, strong) CHDraggableView *avatar;

@end

@implementation CenterViewCell
@synthesize avatarView = avatarView_;
@synthesize userLabel = userLabel_;
@synthesize messageLabel = messageLabel_;
@synthesize distanceLabel = distanceLabel_;
@synthesize publishTimeLabel = publishTimeLabel_;
@synthesize timeUpLabel = timeUpLabel_;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    
    self.avatarView = [[UIImageView alloc] initWithFrame:CGRectMake(17, 13, 55, 55)];
    [[avatarView_ layer] setCornerRadius:10.0f];
    [self.contentView addSubview:avatarView_];
    
    self.userLabel = [[UILabel alloc] init];
    [userLabel_ setFont:[UIFont boldSystemFontOfSize:17.0f]];
    [userLabel_ setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:userLabel_];
    
    
    
    self.messageLabel = [[UILabel alloc] init];
    [messageLabel_ setFont:[UIFont boldSystemFontOfSize:13.0f]];
    [messageLabel_ setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:messageLabel_];
    
    
    self.distanceLabel = [[UILabel alloc] init];
    [distanceLabel_ setTextColor:LabelColor];
    [distanceLabel_ setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:distanceLabel_];
    
    self.publishTimeLabel = [[UILabel alloc] init];
    [publishTimeLabel_ setTextColor:LabelColor];
    [publishTimeLabel_ setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:publishTimeLabel_];
    
    
    self.timeUpLabel = [[UILabel alloc] init];
    [timeUpLabel_ setTextColor:LabelColor];
    [timeUpLabel_ setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:timeUpLabel_];
    
    
    [self clearCellContent];
  }
  return self;
}

- (void)clearCellContent
{
	[self.userLabel setText:nil];
  [self.messageLabel setText:nil];
  [self.distanceLabel setText:nil];
  [self.publishTimeLabel setText:nil];
  [self.timeUpLabel setText:nil];
  
}

- (void)bindCellObject:(id)object
{	
  [self clearCellContent];
  
  [];
  
}

- (void)layoutSubviews
{
	[super layoutSubviews];
  
	
}

@end
