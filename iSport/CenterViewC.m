//
//  CenterViewC.m
//  iSport
//
//  Created by YoungShook on 13-7-20.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import "CenterViewC.h"
#import "SRRefreshView.h"
#import "CenterViewCell.h"
#import "ListTableView.h"
#import "DetailViewController.h"
#import "sportMessage.h"
#import "ListData.h"

@interface CenterViewC ()

@property (nonatomic, strong) NSMutableArray *distanceArray;

@end

@implementation CenterViewC
@synthesize distanceArray = distanceArray_;

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateData:) name:@"updateData" object:nil];
  
  self.listArray = [ListData allListData];
  
  self.tableView = [[ListTableView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  
  _tableView.delegate=self;
  _tableView.dataSource=self;
  _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
  [self.view addSubview:_tableView];
  
  if (_refreshHeaderView == nil) {
		
		EGORefreshTableHeaderView *view = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - self.tableView.bounds.size.height, self.view.frame.size.width, self.tableView.bounds.size.height)];
		view.delegate = self;
		[self.tableView addSubview:view];
		_refreshHeaderView = view;
		[view release];
		
	}
	
	[_refreshHeaderView refreshLastUpdatedDate];
  
}

- (void)setListArray:(NSMutableArray *)listArray
{
	if (listArray != _listArray) {
    [_listArray release];
    _listArray = [listArray retain];
  }
  
  
  [self.distanceArray removeAllObjects];
  self.distanceArray = [NSMutableArray arrayWithCapacity:[_listArray count]];
  for (NSUInteger j = 0; j < [_listArray count]; j++) {
    NSInteger i = arc4random() % 1000;
    NSString *str = [NSString stringWithFormat:@"%d米",i];
//    NSLog(@"Str:%@",str);
    [self.distanceArray addObject:str];
  }
  
  [self.distanceArray sortUsingSelector:@selector(compare:)];
  
}

- (void)setNavigationBarTitle:(NSString *)navigationBarTitle
{
	if (navigationBarTitle != _navigationBarTitle) {
    [_navigationBarTitle release];
    _navigationBarTitle = [navigationBarTitle copy];
  }
  self.title = _navigationBarTitle;
}

-(void)updateData:(NSNotification*)notification{
  NSMutableArray *array = [notification object];
  self.listArray = [array copy];
  
}

-(NSString *)getDate
{
  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
  [formatter setDateFormat:@"MM-dd HH:mm:ss"];
  NSString *locationString=[formatter stringFromDate: [NSDate date]];
  [formatter release];
  return locationString;
}

#pragma mark -
#pragma mark UITableView Delgate

/** 返回一共有多少列*/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

/** 行高*/
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return CellDefaultHeight;
  
}

/** 返回一共有几组记录*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.listArray.count;
}

/** 创建TableViewCell*/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
  static NSString *cellIdentifier = @"CenterCell";
  CenterViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  if (!cell) {
    cell = [[CenterViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
  }
  
  cell.selectionStyle = UITableViewCellSelectionStyleNone;
  cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ArrowRight"]];
  [cell bindCellObject:[self.listArray objectAtIndex:indexPath.row]];
  [cell setDistanceLabelText:[self.distanceArray objectAtIndex:indexPath.row]];
  return cell;
}

/** 处理Cell点击*/
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  DetailViewController *detailVC = [[DetailViewController alloc] initWithNibName:nil bundle:nil];
  [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
	
	[self reloadTableViewDataSource];
	[self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:3.0];
	
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
	
	return _reloading; // should return if data source model is reloading
	
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
	
	return [NSDate date]; // should return date data source was last changed
	
}

#pragma mark -
#pragma mark UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	
	[_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
  
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
	
	[_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
	
}

#pragma mark -
#pragma mark Data Source Loading / Reloading Methods

- (void)reloadTableViewDataSource{
	
	_reloading = YES;
	
}

- (void)doneLoadingTableViewData{
	
	//  model should call this when its done loading
  self.listArray = [ListData allListData];
	_reloading = NO;
	[_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self.tableView];
  
}

@end
