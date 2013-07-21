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

@end

@implementation CenterViewC

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor colorWithRed:0.910 green:0.910 blue:0.906 alpha:1.000];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateData:) name:@"updateData" object:nil];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refresh) name:@"refresh" object:nil];
  [self setNavigationBarTitle:@"周边运动"];
  self.listArray = [ListData allListData];
  self.tableView = [[ListTableView alloc] initWithFrame:self.view.bounds];
  
  _tableView.delegate = self;
  _tableView.dataSource = self;
  _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
  [self.view addSubview:_tableView];
  _tableView.backgroundColor = [UIColor colorWithRed:0.910 green:0.910 blue:0.906 alpha:1.000];
  if (_refreshHeaderView == nil) {
		EGORefreshTableHeaderView *view = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - self.tableView.bounds.size.height, self.view.frame.size.width, self.tableView.bounds.size.height)];
		view.delegate = self;
		[self.tableView addSubview:view];
		_refreshHeaderView = view;
		[view release];
	}
	
	[_refreshHeaderView refreshLastUpdatedDate];

}

-(void)refresh{
    [self setNavigationBarTitle:@"周边运动"];
    self.listArray = [ListData allListData];
    [self.tableView reloadData];
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
    _listArray = [array copy];
    [self.tableView reloadData];
    sportMessage *spm = [_listArray objectAtIndex:0];
    int seleValue = spm.ballType;
    if (seleValue == 0) {
        [self setNavigationBarTitle:@"篮球"];
    }else if (seleValue == 1){
        [self setNavigationBarTitle:@"足球"];
    }else if (seleValue == 2){
        [self setNavigationBarTitle:@"羽毛球"];
    }else if (seleValue == 3){
        [self setNavigationBarTitle:@"乒乓球"];
    }else if (seleValue == 4){
        [self setNavigationBarTitle:@"网球"];
    }
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
    [self setNavigationBarTitle:@"周边运动"];
	_reloading = NO;
	[_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self.tableView];
    [self.tableView reloadData];
	
}

@end
