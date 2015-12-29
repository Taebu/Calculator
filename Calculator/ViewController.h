//
//  ViewController.h
//  Calculator
//
//  Created by TaebuAir on 2015. 3. 12..
//  Copyright (c) 2015년 Taebu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorBrain.h"
@interface ViewController : UIViewController{
    IBOutlet UILabel *display;
    CalculatorBrain *brain;
}

@property (weak, nonatomic) IBOutlet UILabel *display;
-(IBAction)digitPressed:(UIButton *)sender;
-(IBAction)operationPressed:(UIButton *)sender;
@end

