//
//  CenterViewCell.m
//  iSport
//
//  Created by Edward on 13-7-20.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import "CenterViewCell.h"
#import "sportMessage.h"


#define LabelColor   [UIColor colorWithRed:1.000 green:0.720 blue:0.340 alpha:1.000]
#define MessageTextFont					[UIFont boldSystemFontOfSize:13.0f]
#define CellLabelOriginX				80
#define CellMessageOriginY			10
#define MessageContentToBottom	10
#define MessageContentToRight		70

@interface CenterViewCell ()

@property (nonatomic, strong) UIImageView *avatarView;		//用户头像
@property (nonatomic, strong) UILabel *messageLabel;			//消息
@property (nonatomic, strong) UILabel *distanceLabel;			//距离
@property (nonatomic, strong) UILabel *publishTimeLabel;	//发布时间
@property (nonatomic, strong) UILabel *timeUpLabel;				//截至时间

@end

@implementation CenterViewCell
@synthesize avatarView = avatarView_;
@synthesize messageLabel = messageLabel_;
@synthesize distanceLabel = distanceLabel_;
@synthesize publishTimeLabel = publishTimeLabel_;
@synthesize timeUpLabel = timeUpLabel_;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    
    self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cellbg"]];
    
    self.avatarView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
    [[avatarView_ layer] setCornerRadius:25.0f];
    [[avatarView_ layer] setMasksToBounds:YES];
    [self.contentView addSubview:avatarView_];
    
    CALayer *cellImageLayer = self.imageView.layer;
    [cellImageLayer setCornerRadius:9];
    [cellImageLayer setMasksToBounds:YES];
    
    self.messageLabel = [[UILabel alloc] init];
    [messageLabel_ setFont:MessageTextFont];
    [messageLabel_ setOrigin:CGPointMake(CellLabelOriginX, CellMessageOriginY)];
    [messageLabel_ setLineBreakMode:NSLineBreakByTruncatingTail];
    [messageLabel_ setNumberOfLines:0];
    [messageLabel_ setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:messageLabel_];
    
    
    self.distanceLabel = [[UILabel alloc] init];
    [distanceLabel_ setTextColor:LabelColor];
    [distanceLabel_ setFont:[UIFont systemFontOfSize:12.0f]];
    [distanceLabel_ setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:distanceLabel_];
    
    self.publishTimeLabel = [[UILabel alloc] init];
    [publishTimeLabel_ setTextColor:LabelColor];
    [publishTimeLabel_ setFont:[UIFont systemFontOfSize:12.0f]];
    [publishTimeLabel_ setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:publishTimeLabel_];
    
    
    self.timeUpLabel = [[UILabel alloc] init];
    [timeUpLabel_ setTextColor:LabelColor];
    [timeUpLabel_ setFont:[UIFont systemFontOfSize:12.0f]];
    [timeUpLabel_ setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:timeUpLabel_];
    
    
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
  
}

- (void)bindCellObject:(id)object
{
  [self clearCellContent];
  sportMessage *sport = object;
  
  [self.avatarView setImage:[UIImage imageNamed:@"test"]];
  
  if (sport.message) {
    [self.messageLabel setText:@"dfkhvkdfbjknfklcnbkldflvnsdjkbvhcshdvkkk jdvdfnbjdjjjjsdhvjkbdfskbvbdfjzjdfvdfjkl"];
  }
  if (sport.address) {
    [self.distanceLabel setText:sport.address];
  }
  if (sport.pubTimeStr) {
    [self.publishTimeLabel setText:sport.pubTimeStr];
  }
  if (sport.endTimeDataStr) {
    [self.timeUpLabel setText:sport.endTimeDataStr];
  }
  
  
}

- (void)layoutSubviews
{
	[super layoutSubviews];
  
  CGFloat avatarRight = [self.avatarView right];
  CGFloat pubLabelOriginY = [self.avatarView bottom];
  [self.publishTimeLabel setY:pubLabelOriginY];
  
  CGFloat messageWidth = [self width] - CellLabelOriginX - MessageContentToRight;
  CGFloat messageHeight = [self height] - CellMessageOriginY - MessageContentToBottom;
  CGSize messageSize = [self.messageLabel.text sizeWithFont:self.messageLabel.font constrainedToSize:CGSizeMake(messageWidth, messageHeight) lineBreakMode:self.messageLabel.lineBreakMode];
  [self.messageLabel setSize:messageSize];
  
  
  CGFloat ditanceLabelOriginY = [self.messageLabel bottom];
  [self.distanceLabel setY:ditanceLabelOriginY];
  [self.distanceLabel setCenterX:self.centerX];
  
  [self.timeUpLabel setY:[self.messageLabel bottom]];
  [self.timeUpLabel setX:[self width] - 90];
  
  [self.distanceLabel sizeToFit];
  [self.publishTimeLabel sizeToFit];
  [self.timeUpLabel sizeToFit];
	
}

@end
