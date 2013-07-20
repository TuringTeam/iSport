//
//  InputViewController.h
//  iSport
//
//  Created by Felix_Y on 13-7-21.
//  Copyright (c) 2013年 qfpay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sportMessage.h"
#import "IZValueSelectorView.h"
@interface InputViewController : UIViewController<IZValueSelectorViewDataSource,IZValueSelectorViewDelegate>
{
    BOOL isCharges;
    NSString *infoString;
    kBallType type;
    NSString *timeLimite;
}

@property (nonatomic, retain) sportMessage* sMsg;
@property (retain, nonatomic) IBOutlet UITextField *infoTF;
@property (retain, nonatomic) IBOutlet UIButton *isChargesBtn;
@property (retain, nonatomic) IBOutlet UIPickerView *timeLimitePV;
@property (nonatomic,weak) IBOutlet IZValueSelectorView *selectorTimeLimiteV;
@property (nonatomic,weak) IBOutlet IZValueSelectorView *selectorTypeV;

@end
