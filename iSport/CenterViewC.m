//
//  CenterViewC.m
//  iSport
//
//  Created by YoungShook on 13-7-20.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import "CenterViewC.h"
#import "MsgCell.h"
#import "CenterViewCell.h"
#import "ListTableView.h"

@interface CenterViewC ()

@end

@implementation CenterViewC

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.listArray = [NSMutableArray new];
  
  for (NSInteger i = 0; i < 30; i++) {
    sportMessage *sport = [[sportMessage alloc] init];
    sport.ID = [NSString stringWithFormat:@"ID%d",i];
    sport.message = [NSString stringWithFormat:@"Message %d",i];
    sport.pubTimeStr = [NSString stringWithFormat:@"%d分钟前",i+1];
    sport.endTimeDataStr = [NSString stringWithFormat:@"%d小时后",i+1];
    sport.address = [NSString stringWithFormat:@"体育场"];
    sport.remarks = [NSString stringWithFormat:@"remarks%d",i];
    [self.listArray addObject:sport];
  }
  
  self.tableView = [[ListTableView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  _tableView.delegate=self;
  _tableView.dataSource=self;
  _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
  [self.view addSubview:_tableView];
  
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
  return self.listArray.count;
}

/** 行高*/
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return CellDefaultHeight;
  
}

/** 返回一共有几组记录*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 1;
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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
