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

@interface DetailViewController ()

@property (nonatomic, strong) UITableView *tableView;

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
  
  //self.tableView = [[ListTableView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds] style:UITableViewStyleGrouped];
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
	DetailHeaderView *headerView = [[DetailHeaderView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
  UIImage *resizedImage = [[UIImage imageNamed:@"HeaderViewTopbg"] stretchableImageWithLeftCapWidth:28 topCapHeight:95];
  UIImageView *headerBackGroundView = [[UIImageView alloc] initWithImage:resizedImage];
  [headerView addSubview:headerBackGroundView];
  
  [self.tableView setTableHeaderView:headerView];
  //[headerView sendSubviewToBack:headerBackGroundView];
  
  
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
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
  static NSString *TimeCellType = @"TIME";
  static NSString *DetailCellType = @"DETAIL";
  static NSString *AvatarCellType = @"AVATAR";
  
  UITableViewCell *cell = nil;
  
  NSInteger section = indexPath.section;
  NSInteger row = indexPath.row;
  
  switch (section) {
    case DesSection:
      switch (row) {
        case DesCell:
          cell = [tableView dequeueReusableCellWithIdentifier:TimeCellType];
          if (!cell) {
            cell = [[[TitleTypeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TitleCellID] autorelease];
          }
          break;
          
        default:
          break;
      }
      break;
    case DetailSection:
      switch (row) {
        case TimeCell:
          cell = [tableView dequeueReusableCellWithIdentifier:TimeCellType];
          if (cell != nil) {
            cell = [[[TimeTypeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TimeCellType] autorelease];
          }
          break;
        case DistabceCell:
          cell = [tableView dequeueReusableCellWithIdentifier:TimeCellType];
          if (cell == nil) {
            cell = [[[TimeTypeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TimeCellType] autorelease];
          }
          break;
        case LocationCell:
          cell = [tableView dequeueReusableCellWithIdentifier:DetailCellType];
          if (cell == nil) {
            cell = [[[DetailTypeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DetailCellType] autorelease];
          }
          break;
          
        default:
          break;
      }
      break;
    case PeopleSection:
      
      switch (row) {
        case CellTypeAvatar:
          cell = [tableView dequeueReusableCellWithIdentifier:AvatarCellType];
          if (cell == nil) {
            cell = [[[AvatarTypeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:AvatarCellType] autorelease];
          }
          break;
          
        default:
          break;
      }
      break;
    default:
       NSAssert(0, @"Overflow cell");
      break;
  }

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
