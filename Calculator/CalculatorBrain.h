//
//  CalculatorBrain.h
//  Calculator
//
//  Created by TaebuAir on 2015. 3. 12..
//  Copyright (c) 2015년 Taebu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject{
    double operand;
    NSString *waitingOperation;
    double waitingOperand;
}

-(void)pushOperand:(double)operand;
-(double)performOperation:(NSString *)operation;

@end