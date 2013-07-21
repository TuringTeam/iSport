//
//  LeftViewC.m
//  iSport
//
//  Created by YoungShook on 13-7-20.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import "LeftViewC.h"
#import "ListData.h"
#import "InputVC.h"
@interface SeperateLine : UIView

@end

@implementation SeperateLine

-(void)drawRect:(CGRect)rect{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGContextSetLineWidth(context, 1);
    
    CGContextSetStrokeColorWithColor(context,[UIColor blackColor].CGColor);
    CGContextBeginPath(context);
    CGContextMoveToPoint(context,0, 0);
    CGContextAddLineToPoint(context, self.bounds.size.width, 0);
    CGContextStrokePath(context);
}

@end

@interface LeftViewC ()

@end

@implementation LeftViewC

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.view.backgroundColor = [UIColor colorWithRed:0.145 green:0.161 blue:0.196 alpha:1.000];
  
  _listArray = [[NSMutableArray alloc]initWithObjects:@{@"image":@"sendMsg",@"title":@"发送"},@{@"image":@"home",@"title":@"周边活动"},@{@"image":@"basketball",@"title":@"篮球"},@{@"image":@"football",@"title":@"足球"},@{@"image":@"badminton",@"title":@"羽毛球"},@{@"image":@"pingpong",@"title":@"乒乓球"},@{@"image":@"tennis",@"title":@"网球"},nil];
  
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0,
                                                            self.view.frame.size.width,
                                                            self.view.frame.size.height)];
  _tableView.delegate = self;
  _tableView.dataSource = self;
  _tableView.backgroundColor=[UIColor clearColor];
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
  [self.view addSubview:_tableView];
    UIImageView *setImg = [[UIImageView alloc]initWithFrame:CGRectMake(20, self.view.frame.size.height - 40, 18, 18)];
    setImg.image = [UIImage imageNamed:@"set"];
    [self.view addSubview:setImg];
}

#pragma mark -
#pragma mark UITableView Delgate

/** 返回一共有几组记录*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}

/** 行高*/
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 130;
    }
    return 44;
}

/** 创建TableViewCell*/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellHeader"];
        if(cell == nil){
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellHeader"]autorelease];
        }
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        double imageSize = 68;
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 30, imageSize, imageSize)];
        imageView.layer.masksToBounds = YES;
        imageView.layer.cornerRadius = imageSize / 2.0;
        imageView.image = [UIImage imageNamed:@"test.png"];
        [cell addSubview:imageView];
        [imageView release];
        UIImageView *lineImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"line"]];
        lineImage.frame = CGRectMake(0, 130, 320, 2);
        [cell addSubview:lineImage];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LeftTableViewCell"];
    if(!cell)
        {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"LeftTableViewCell" owner:self options:nil] lastObject];
        }
    NSString *imageStr = [[_listArray objectAtIndex:indexPath.row-1]objectForKey:@"image"];
    UIImageView *imageView = (UIImageView*)[cell viewWithTag:101];
    imageView.image = [UIImage imageNamed:imageStr];
    UILabel *title = (UILabel *)[cell viewWithTag:102];
    title.text = [[_listArray objectAtIndex:indexPath.row-1] objectForKey:@"title"];
    UIImageView *lineImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"line"]];
    lineImage.frame = CGRectMake(0, 44, 320, 2);
    cell.selectedBackgroundView = [[[UIView alloc] initWithFrame:cell.frame] autorelease];
    cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:0.059 green:0.063 blue:0.075 alpha:1.000];
    [cell addSubview:lineImage];
    return cell;
}

/** 处理Cell点击*/
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return;
    }
    
    if (indexPath.row == 1) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"present" object:@"presentInput"];
    }else if(indexPath.row == 2){
        [[NSNotificationCenter defaultCenter] postNotificationName:@"present" object:@"presentCenter"];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"refresh" object:nil];
    }else{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"present" object:@"presentCenter"];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"updateData" object:[ListData sortListData:indexPath.row]];
    }
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

@end
