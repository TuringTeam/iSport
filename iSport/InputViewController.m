//
//  InputViewController.m
//  iSport
//
//  Created by Felix_Y on 13-7-21.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import "InputViewController.h"

@interface InputViewController ()

@end

@implementation InputViewController
@synthesize sMsg;
@synthesize selectorTimeLimiteV = _selectorTimeLimiteV;
@synthesize selectorTypeV = _selectorTypeV;
    
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    isCharges = NO;
    [super viewDidLoad];
   
    //YOU CAN ALSO ASSIGN THE DATA SOURCE AND THE DELEGATE IN CODE (IT'S ALREADY DONE IN NIB, BUT DO AS YOU PREFER)
    self.selectorTimeLimiteV.dataSource = self;
    self.selectorTimeLimiteV.delegate = self;
    self.selectorTimeLimiteV.shouldBeTransparent = YES;
    self.selectorTimeLimiteV.horizontalScrolling = NO;
    self.selectorTimeLimiteV.tag = 0010;
    
    self.selectorTypeV.dataSource = self;
    self.selectorTypeV.delegate = self;
    self.selectorTypeV.shouldBeTransparent = YES;
    self.selectorTypeV.horizontalScrolling = YES;
    self.selectorTypeV.tag = 0020;
    
    //You can toggle Debug mode on selectors to see the layout
    self.selectorTimeLimiteV.debugEnabled = NO;
    self.selectorTypeV.debugEnabled = NO;
	// Do any additional setup after loading the view.
}

#pragma IZValueSelector dataSource
- (NSInteger)numberOfRowsInSelector:(IZValueSelectorView *)valueSelector {
    if (valueSelector.tag == 0010) {
        return 6;
    }
    else {
        return 5;
    }
}



//ONLY ONE OF THESE WILL GET CALLED (DEPENDING ON the horizontalScrolling property Value)
- (CGFloat)rowHeightInSelector:(IZValueSelectorView *)valueSelector {
    return 30.0;
}

- (CGFloat)rowWidthInSelector:(IZValueSelectorView *)valueSelector {
    return 30.0;
}


- (UIView *)selector:(IZValueSelectorView *)valueSelector viewForRowAtIndex:(NSInteger)index {
    UILabel * label = nil;
    if (valueSelector.tag == 0010) {
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, self.selectorTimeLimiteV.frame.size.height)];
        switch (index.numberOfRowsInSelector) {
            case 0:
                label.text = [NSString stringWithFormat:@"1小时"];
                break;
            case 1:
                label.text = [NSString stringWithFormat:@"3小时"];
                break;
            case 2:
                label.text = [NSString stringWithFormat:@"5小时"];
                break;
            case 3:
                label.text = [NSString stringWithFormat:@"1天"];
                break;
            case 4:
                label.text = [NSString stringWithFormat:@"2天"];
                break;
            case 5:
                label.text = [NSString stringWithFormat:@"3天"];
            default:
                break;
        }
    }
    else {
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,30, self.selectorTypeV.frame.size.width)];
        switch (index.numberOfRowsInSelector) {
            case 0:
                label.text = [NSString stringWithFormat:@"篮球"];
                break;
            case 1:
                label.text = [NSString stringWithFormat:@"足球"];
                break;
            case 2:
                label.text = [NSString stringWithFormat:@"羽毛球"];
                break;
            case 3:
                label.text = [NSString stringWithFormat:@"乒乓球"];
                break;
            case 4:
                label.text = [NSString stringWithFormat:@"网球"];
                break;
            default:
                break;
    }
    
    label.textAlignment =  NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    return label;
}

- (CGRect)rectForSelectionInSelector:(IZValueSelectorView *)valueSelector {
    //Just return a rect in which you want the selector image to appear
    //Use the IZValueSelector coordinates
    //Basically the x will be 0
    //y will be the origin of your image
    //width and height will be the same as in your selector image
    if (valueSelector == self.selectorHorizontal) {
        return CGRectMake(self.selectorHorizontal.frame.size.width/2 - 35.0, 0.0, 70.0, 90.0);
    }
    else {
        return CGRectMake(0.0, self.selectorVertical.frame.size.height/2 - 35.0, 90.0, 70.0);
    }
    
}

#pragma IZValueSelector delegate
- (void)selector:(IZValueSelectorView *)valueSelector didSelectRowAtIndex:(NSInteger)index {
    NSLog(@"Selected index %d",index);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)dealloc {
    [_infoTF release];
    [_isChargesBtn release];
    [_timeLimitePV release];
    [super dealloc];
}

- (void)viewDidUnload {
    [self setInfoTF:nil];
    [self setIsChargesBtn:nil];
    [self setTimeLimitePV:nil];
    [super viewDidUnload];
}
@end
