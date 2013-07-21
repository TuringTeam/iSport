//
//  CenterViewC.h
//  iSport
//
//  Created by YoungShook on 13-7-20.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sportMessage.h"
#import "EGORefreshTableHeaderView.h"

@interface CenterViewC : UIViewController<UITableViewDataSource,UITableViewDelegate,EGORefreshTableHeaderDelegate>
{
  EGORefreshTableHeaderView *_refreshHeaderView;
	
	BOOL _reloading;
}

@property(nonatomic, retain) NSMutableArray *listArray;  //数据源
@property(nonatomic, retain) UITableView *tableView;		 //TableView
@property (nonatomic, strong) sportMessage *sport;			 //数据对象

@property (nonatomic, copy) NSString *navigationBarTitle;//

- (void)reloadTableViewDataSource;
- (void)doneLoadingTableViewData;

@end
