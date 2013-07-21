//
//  InputVC.m
//  iSport
//
//  Created by Felix_Y on 13-7-21.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import "InputVC.h"

@interface InputVC ()

@end

@implementation InputVC

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
    [super viewDidLoad];
    [self.infoTextView becomeFirstResponder];
    
    //YOU CAN ALSO ASSIGN THE DATA SOURCE AND THE DELEGATE IN CODE (IT'S ALREADY DONE IN NIB, BUT DO AS YOU PREFER)
    self.timeLimieView.dataSource = self;
    self.timeLimieView.delegate = self;
    self.timeLimieView.shouldBeTransparent = YES;
    self.timeLimieView.horizontalScrolling = YES;
    self.timeLimieView.tag = 0010;
    
    self.typeSelectView.dataSource = self;
    self.typeSelectView.delegate = self;
    self.typeSelectView.shouldBeTransparent = YES;
    self.typeSelectView.horizontalScrolling = YES;
    self.typeSelectView.tag = 0020;
    
    //You can toggle Debug mode on selectors to see the layout
    self.timeLimieView.debugEnabled = NO;
    self.typeSelectView.debugEnabled = NO;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)isCharges:(id)sender{


}

#pragma IZValueSelector dataSource
- (NSInteger)numberOfRowsInSelector:(IZValueSelectorView *)valueSelector {
    if (valueSelector.tag == 0010) {
        return 5;
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
    return 70.0;
}


- (UIView *)selector:(IZValueSelectorView *)valueSelector viewForRowAtIndex:(NSInteger)index {
    UILabel * label = nil;
    if (valueSelector.tag == 0010) {
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
        switch (index) {
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
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,55, 30)];
        switch (index) {
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
    }
    label.textAlignment =  UITextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    return label;
    
}
- (CGRect)rectForSelectionInSelector:(IZValueSelectorView *)valueSelector {
    //Just return a rect in which you want the selector image to appear
    //Use the IZValueSelector coordinates
    //Basically the x will be 0
    //y will be the origin of your image
    //width and height will be the same as in your selector image
    if (valueSelector == self.timeLimieView) {
        return CGRectMake(self.timeLimieView.frame.size.width/2 - 35.0, 0.0, 70.0, 90.0);
    }
    else {
        return CGRectMake(0.0, self.typeSelectView.frame.size.height/2 - 35.0, 90.0, 70.0);
    }
    
}

#pragma IZValueSelector delegate
- (void)selector:(IZValueSelectorView *)valueSelector didSelectRowAtIndex:(NSInteger)index {
    NSLog(@"Selected index %d",index);
}

- (void)dealloc {
    [_typeSelectView release];
    [_timeLimieView release];
    [_isChargesBtn release];
    [_infoTextView release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setTypeSelectView:nil];
    [self setTimeLimieView:nil];
    [self setIsChargesBtn:nil];
    [self setInfoTextView:nil];
    [super viewDidUnload];
}
@end
