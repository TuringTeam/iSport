//
//  CenterViewC.h
//  iSport
//
//  Created by YoungShook on 13-7-20.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sportMessage.h"

@interface CenterViewC : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, retain) NSMutableArray *listArray;
@property(nonatomic, retain) UITableView *tableView;
@property (nonatomic, strong) sportMessage *sport;

@property (nonatomic, copy) NSString *navigationBarTitle;

@end
