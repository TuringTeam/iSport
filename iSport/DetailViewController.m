//
//  DetailViewController.m
//  iSport
//
//  Created by Edward on 13-7-21.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import "DetailViewController.h"
#import "ListTableView.h"

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
  
  self.tableView = [[ListTableView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  
  [self.view addSubview:self.tableView];
  
  UIImage *image = [UIImage imageNamed:@"back"];
  UIButton *barButton = [UIButton buttonWithType:UIButtonTypeCustom];
  [barButton setImage:image forState:UIControlStateNormal];
  barButton.frame = CGRectMake(0, 0, 30, 22);
  
  [barButton addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
  UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:barButton];
  self.navigationItem.leftBarButtonItem = barItem;
  [barItem release];
}

- (void)pop
{
	[self.navigationController popViewControllerAnimated:YES];
}

- (void)setUpSubViews
{
	
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
