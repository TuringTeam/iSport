//
//  InputVC.h
//  iSport
//
//  Created by Felix_Y on 13-7-21.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IZValueSelectorView.h"
@interface InputVC : UIViewController<IZValueSelectorViewDataSource,IZValueSelectorViewDelegate>
@property (retain, nonatomic) IBOutlet IZValueSelectorView *typeSelectView;

@property (retain, nonatomic) IBOutlet IZValueSelectorView *timeLimieView;
@property (retain, nonatomic) IBOutlet UIButton *isChargesBtn;
@property (retain, nonatomic) IBOutlet UITextView *infoTextView;
@property (retain, nonatomic) IBOutlet UIButton *backBtn;

- (IBAction)isCharges:(id)sender;
@end
