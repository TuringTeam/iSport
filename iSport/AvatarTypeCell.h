//
//  AvatarTypeCell.h
//  iSport
//
//  Created by Edward on 13-7-21.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AvatarTypeCell : UITableViewCell

- (void)bindAvatarImage:(NSString *)avatarImage message:(NSString *)message;

- (void)bindWithObject:(id)object;

@end
