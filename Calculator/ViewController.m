//
//  ViewController.m
//  Calculator
//
//  Created by TaebuAir on 2015. 3. 12..
//  Copyright (c) 2015년 Taebu. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorBrain.h"

@interface ViewController ()
@property (nonatomic)BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic,strong)CalculatorBrain *brain;
@end

@implementation ViewController

@synthesize display = _display;
@synthesize userIsInTheMiddleOfEnteringANumber=_userIsInTheMiddleOfEnteringANumber;
@synthesize brain = _brain;

-(CalculatorBrain *)brain
{
    if (!_brain) _brain = [[CalculatorBrain alloc]init];
    return _brain;
}

-(IBAction)digitPressed:(UIButton *)sender
{
    //NSString *digit= sender.currentTitle;
    NSString *digit= [sender currentTitle];
    NSLog(@"digit pressed = %@",digit);
    
    if(self.userIsInTheMiddleOfEnteringANumber){
    self.display.text = [self.display.text stringByAppendingString:digit];
    }else{
        self.display.text =digit;
        self.userIsInTheMiddleOfEnteringANumber=YES;
    }
    
}

- (IBAction)enterPressed{
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;
}

- (IBAction)operationPressed:(UIButton *)sender{
    
    if(self.userIsInTheMiddleOfEnteringANumber){
        [self enterPressed];
    }
  //  NSString *operation = [[sender titleLabel] text];
    double result = [self.brain performOperation:sender.currentTitle];
    NSLog(@"Operation pressed = %@",sender.currentTitle);

    NSString *resultString =[NSString stringWithFormat:@"%g",result];
    //[display setText:[NSString stringWithFormat:@"%g",result]];
    self.display.text=resultString;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
