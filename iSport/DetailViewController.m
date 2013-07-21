//
//  DetailViewController.m
//  iSport
//
//  Created by Edward on 13-7-21.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import "DetailViewController.h"
#import "ListTableView.h"
#import "DetailHeaderView.h"
#import "TimeTypeCell.h"
#import "TitleTypeCell.h"
#import "DetailTypeCell.h"
#import "AvatarTypeCell.h"

typedef NS_ENUM(NSInteger, CellType) {
	CellTypeTitle = 0,
  CellTypeTime,
  CellTypeDetail,
  CellTypeAvatar,
  CellTypeCount
};

typedef NS_ENUM(NSInteger, Section) {
	DesSection = 0,
  DetailSection,
  PeopleSection,
  SectionCount
};

typedef NS_ENUM(NSInteger, DesCellType) {
	DesCell = 0,
  DesCellTypeCount
};

typedef NS_ENUM(NSInteger, DetailCellType) {
	TimeCell = 0,
  DistabceCell,
  LocationCell,
  DetailCellTypeCount
};

typedef NS_ENUM(NSInteger, PeopleCellType) {
	PeopleCell = 0,
  PeopleCellTypeCount
};
static NSString * const text = @"一起来吧，周日1点半大运村中间长廊集合.这次的篮球赛我们一定要赢";

@interface DetailViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSString *Des;
@property (nonatomic, strong) NSDictionary *dictionary;
@property (nonatomic, copy) NSString *name;

@end

@implementation DetailViewController
@synthesize tableView = tableView_;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.tableView = [[ListTableView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  [self.tableView setDelegate:self];
  [self.tableView setDataSource:self];
  [self.view addSubview:self.tableView];
  
  UIImage *image = [UIImage imageNamed:@"back"];
  UIButton *barButton = [UIButton buttonWithType:UIButtonTypeCustom];
  [barButton setImage:image forState:UIControlStateNormal];
  barButton.frame = CGRectMake(0, 0, 30, 22);
  
  [barButton addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
  UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:barButton];
  self.navigationItem.leftBarButtonItem = barItem;
  [barItem release];
  
  [self setUpSubViews];
}

- (void)pop
{
	[self.navigationController popViewControllerAnimated:YES];
}

- (void)setUpSubViews
{
  //	DetailHeaderView *headerView = [[DetailHeaderView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
  //  UIImage *resizedImage = [[UIImage imageNamed:@"HeaderViewTopbg"] stretchableImageWithLeftCapWidth:28 topCapHeight:95];
  //  UIImageView *headerBackGroundView = [[UIImageView alloc] initWithImage:resizedImage];
  //  [headerView addSubview:headerBackGroundView];
  
  //[self.tableView setTableHeaderView:headerView];
  //[headerView sendSubviewToBack:headerBackGroundView];
  
  //self.dictionary = [NSDictionary dictionaryWithObject:<#(id)#> forKey:<#(id<NSCopying>)#>];
  
  
}

- (CGFloat)tableView:(UITableView *)tableView
		heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.section == 0 && indexPath.row == 0) {
    return [TitleTypeCell RowHightWithObject:text];
  }
  
  return 44;
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  NSLog(@"SectionCount:%d",SectionCount);
	return SectionCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  NSLog(@"Row = %d",section);
  
	NSInteger row = 0;
  switch (section) {
    case  DesSection:
      row = DesCellTypeCount;
      break;
    case DetailSection:
      row = DetailCellTypeCount;
      break;
    case PeopleSection:
      row = PeopleCellTypeCount;
      break;
      
    default:
      break;
  }
  NSLog(@"  \t%d",row);
  return row;
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *TitleCellID = @"TITLE";
  static NSString *TimeCellID = @"TIME";
  static NSString *DetailCellID = @"DETAIL";
  static NSString *AvatarCellID = @"AVATAR";
  
  UITableViewCell *cell = nil;
  
  NSInteger section = indexPath.section;
  NSInteger row = indexPath.row;
  
  switch (section) {
    case 0:
      switch (row) {
        case 0:
          cell = [tableView dequeueReusableCellWithIdentifier:TitleCellID];
          if (!cell) {
            cell = [[[TitleTypeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TitleCellID] autorelease];
            [(TitleTypeCell *)cell bindTitle:text];
          }
          break;
          
        default:
          break;
      }
      break;
    case 1:
      switch (row) {
        case 0:
          cell = [tableView dequeueReusableCellWithIdentifier:TimeCellID];
          if (!cell) {
            cell = [[[TimeTypeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TimeCellID] autorelease];
            [(TimeTypeCell *)cell bindTitle:@"时间" timeStr:@"2013-07-18"];
          }
          break;
          
        case 1:
          cell = [tableView dequeueReusableCellWithIdentifier:TimeCellID];
          if (!cell) {
            cell = [[[TimeTypeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TimeCellID] autorelease];
            [(TimeTypeCell *)cell bindTitle:@"距离" timeStr:@"3.12km"];
          }
          break;
          
        case 2:
          cell = [tableView dequeueReusableCellWithIdentifier:DetailCellID];
          if (!cell) {
            cell = [[[DetailTypeCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:DetailCellID] autorelease];
          }
          cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ArrowRight"]];
          [(DetailTypeCell *)cell bindTitle:@"地点" detail:@"海淀区知春路29号院"];
          break;
          
        default:
          break;
      }
      break;
    case 2:
      
      switch (row) {
        case 0:
          cell = [tableView dequeueReusableCellWithIdentifier:AvatarCellID];
          if (!cell) {
            cell = [[[AvatarTypeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:AvatarCellID] autorelease];
          }
          [(AvatarTypeCell *)cell bindAvatarImage:nil message:@"神经比较大"];
          break;
          
        default:
          break;
      }
      break;
    default:
      //NSAssert(0, @"Overflow cell");
      break;
  }
  cell.selectionStyle = UITableViewCellSelectionStyleNone;
  return cell;
}

- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section
{
  NSString *title = nil;
	switch (section) {
    case DesSection:
      title = @"活动介绍";
      break;
    case DetailSection:
      title = @"活动资料";
      break;
    case PeopleSection:
      title = @"参加人员";
      break;
    default:
      
      break;
  }
  return title;
}
@end
