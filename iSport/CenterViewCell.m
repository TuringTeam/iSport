//
//  CenterViewCell.m
//  iSport
//
//  Created by Edward on 13-7-20.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import "CenterViewCell.h"
#import "sportMessage.h"


#define LabelColor   						[UIColor colorWithRed:0.572 green:0.562 blue:0.597 alpha:1.000]
#define MessageTextFont					[UIFont boldSystemFontOfSize:15.0f]
#define CellLabelOriginX				80
#define CellMessageOriginY			10
#define MessageContentToBottom	10
#define MessageContentToRight		60

@interface CenterViewCell ()

@property (nonatomic, strong) UIImageView *avatarView;		//用户头像
@property (nonatomic, strong) UILabel *messageLabel;			//消息
@property (nonatomic, strong) UILabel *distanceLabel;			//距离
@property (nonatomic, strong) UILabel *publishTimeLabel;	//发布时间
@property (nonatomic, strong) UILabel *timeUpLabel;				//截至时间
@property (nonatomic, strong) UIImageView *sportImage;		//sport icon

@end

@implementation CenterViewCell
@synthesize avatarView = avatarView_;
@synthesize messageLabel = messageLabel_;
@synthesize distanceLabel = distanceLabel_;
@synthesize publishTimeLabel = publishTimeLabel_;
@synthesize timeUpLabel = timeUpLabel_;
@synthesize sportImage = sportImage_;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    
    self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cellbg"]];
    
    self.avatarView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 57, 57)];
    [[avatarView_ layer] setCornerRadius:27.0f];
    [[avatarView_ layer] setMasksToBounds:YES];
    [self.contentView addSubview:avatarView_];
    
    CALayer *cellImageLayer = self.imageView.layer;
    [cellImageLayer setCornerRadius:9];
    [cellImageLayer setMasksToBounds:YES];
    
    self.messageLabel = [[UILabel alloc] init];
    [messageLabel_ setFont:MessageTextFont];
    [messageLabel_ setOrigin:CGPointMake(CellLabelOriginX, CellMessageOriginY)];
    [messageLabel_ setLineBreakMode:NSLineBreakByTruncatingTail];
    [messageLabel_ setNumberOfLines:2];
    [messageLabel_ setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:messageLabel_];
    
    
    self.distanceLabel = [[UILabel alloc] init];
    [distanceLabel_ setTextColor:LabelColor];
    [distanceLabel_ setFont:[UIFont systemFontOfSize:12.0f]];
    [distanceLabel_ setBackgroundColor:[UIColor clearColor]];
    [distanceLabel_ setX:180];
    [distanceLabel_ setY:5];
    [self.contentView addSubview:distanceLabel_];
    
    self.publishTimeLabel = [[UILabel alloc] init];
    [publishTimeLabel_ setTextColor:LabelColor];
    [publishTimeLabel_ setFont:[UIFont systemFontOfSize:10.0f]];
    [publishTimeLabel_ setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:publishTimeLabel_];
    
    
    self.timeUpLabel = [[UILabel alloc] init];
    [timeUpLabel_ setTextColor:LabelColor];
    [timeUpLabel_ setFont:[UIFont systemFontOfSize:10.0f]];
    [timeUpLabel_ setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:timeUpLabel_];
    
    self.sportImage = [[UIImageView alloc] initWithFrame:CGRectMake(280, -1, 16/0.8, 20/0.8)];
    [self.contentView addSubview:sportImage_];
    
    [self clearCellContent];
  }
  return self;
}

- (void)clearCellContent
{
  [self.messageLabel setText:nil];
  [self.distanceLabel setText:nil];
  [self.publishTimeLabel setText:nil];
  [self.timeUpLabel setText:nil];
  [sportImage_ setImage:nil];
  
}

- (void)setDistanceLabelText:(NSString *)text
{
	[self.distanceLabel setText:text];
  [self.distanceLabel sizeToFit];
}

- (void)bindCellObject:(id)object
{
  [self clearCellContent];
  sportMessage *sport = object;
  
  if (sport.headImage) {
    
    NSString *imageName = [NSString stringWithFormat:@"%@.jpg",sport.headImage];
    [self.avatarView setImage:[UIImage imageNamed:imageName]];
  }
  
  //[self.avatarView setImage:[UIImage imageNamed:@"test"]];
  
  if (sport.message) {
    [self.messageLabel setText:sport.message];
  }
  //  if (sport.address) {
  //    [self.distanceLabel setText:sport.address];
  //  }
  
  
  
  if (sport.pubTimeStr) {
    [self.publishTimeLabel setText:sport.pubTimeStr];
  }
  if (sport.endTimeDataStr) {
    [self.timeUpLabel setText:sport.endTimeDataStr];
  }
  
  switch (sport.ballType) {
    case kBasketball:
      [self.sportImage setImage:[UIImage imageNamed:@"markbasketball"]];
      break;
    case kFootball:
      [self.sportImage setImage:[UIImage imageNamed:@"markfootball"]];
      break;
    case kBadminton:
      [self.sportImage setImage:[UIImage imageNamed:@"markbadminton"]];
      break;
    case kTennisBall:
      [self.sportImage setImage:[UIImage imageNamed:@"marktinnisball"]];
      break;
    case kPingpong:
      [self.sportImage setImage:[UIImage imageNamed:@"markpingpang"]];
      break;
    default:
      break;
  }
}

- (void)layoutSubviews
{
	[super layoutSubviews];
  
  CGFloat labelOriginY = CellDefaultHeight - 18;
  
  CGFloat cellCenterY = CellDefaultHeight/2;
  
  CGFloat messageWidth = [self width] - CellLabelOriginX - MessageContentToRight;
  CGFloat messageHeight = [self height] - CellMessageOriginY - MessageContentToBottom;
  CGSize messageSize = [self.messageLabel.text sizeWithFont:self.messageLabel.font constrainedToSize:CGSizeMake(messageWidth, messageHeight) lineBreakMode:self.messageLabel.lineBreakMode];
  [self.messageLabel setSize:messageSize];
  [self.messageLabel setCenterY:cellCenterY];
  
  [self.publishTimeLabel setY:labelOriginY];
  [self.publishTimeLabel setX:[self.messageLabel x]];
  
  [self.distanceLabel sizeToFit];
  CGFloat distabceLabelOriginX = [self.sportImage left] - [self.distanceLabel width] - 10;
  [self.distanceLabel setY:3];
  [self.distanceLabel setX:distabceLabelOriginX];
  
  [self.timeUpLabel sizeToFit];
  [self.timeUpLabel setY:labelOriginY];
  [self.timeUpLabel setX:320 - [self.timeUpLabel width] - 10];
  
  
  [self.publishTimeLabel sizeToFit];
  
	
}

- (void)dealloc
{
	[avatarView_ release];
  [messageLabel_ release];
  [distanceLabel_ release];
  [publishTimeLabel_ release];
  [timeUpLabel_ release];
  [sportImage_ release];
  [super dealloc];
}

@end
