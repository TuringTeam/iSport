//
//  DetailViewController.h
//  iSport
//
//  Created by Edward on 13-7-21.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UIImageView *backgroundView;
@property (nonatomic, strong) UIImageView *avatarView;

@end
