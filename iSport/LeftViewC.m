//
//  LeftViewC.m
//  iSport
//
//  Created by YoungShook on 13-7-20.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import "LeftViewC.h"
@interface LeftViewC ()

@end

@implementation LeftViewC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.145 green:0.161 blue:0.196 alpha:1.000];
    _listArray = [[NSMutableArray alloc]initWithObjects:@{@"image":@"sendMsg",@"title":@"发送"},@{@"image":@"basketball",@"title":@"篮球"},@{@"image":@"football",@"title":@"足球"},@{@"image":@"badminton",@"title":@"羽毛球"},@{@"image":@"pingpong",@"title":@"乒乓球"},@{@"image":@"tennisBall",@"title":@"网球"},nil];
	_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0,
                                                              self.view.frame.size.width,
                                                              self.view.frame.size.height)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    _tableView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:_tableView];
}

#pragma mark -
#pragma mark UITableView Delgate

/** 返回一共有多少列*/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 7;
}

/** 行高*/
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

/** 返回一共有几组记录*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

/** 创建TableViewCell*/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LeftTableViewCell"];
    if(!cell)
        {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"LeftTableViewCell" owner:self options:nil] lastObject];
        }
    
    NSLog(@"%d",indexPath.row);
    NSString *imageStr = [[_listArray objectAtIndex:indexPath.row]objectForKey:@"image"];
    UIImageView *imageView = (UIImageView*)[cell viewWithTag:101];
    imageView.image = [UIImage imageNamed:imageStr];
    UILabel *title = (UILabel *)[cell viewWithTag:102];
    title.text = [[_listArray objectAtIndex:indexPath.row] objectForKey:@"title"];
    
    return cell;
}

/** 处理Cell点击*/
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
