//
//  CenterViewC.m
//  iSport
//
//  Created by YoungShook on 13-7-20.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import "CenterViewC.h"
#import "MsgCell.h"
@interface CenterViewC ()

@end

@implementation CenterViewC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.361 green:0.573 blue:0.573 alpha:1.000];
    _listArray = [NSMutableArray new];
	_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0,
                                                                self.view.frame.size.width,
                                                                self.view.frame.size.height)];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:_tableView];
}

#pragma mark -
#pragma mark UITableView Delgate

/** 返回一共有多少列*/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 55;
}

/** 行高*/
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 72;
}

/** 返回一共有几组记录*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

/** 创建TableViewCell*/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifiy = @"MsgCell";
    MsgCell *cell= [tableView dequeueReusableCellWithIdentifier:identifiy];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MsgCell" owner:self options:nil]  objectAtIndex:0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
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
