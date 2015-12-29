//
//  CalculatorBrain.m
//  Calculator
//
//  Created by TaebuAir on 2015. 3. 12..
//  Copyright (c) 2015년 Taebu. All rights reserved.
//

#import "CalculatorBrain.h"
@interface CalculatorBrain()
@property (nonatomic,strong) NSMutableArray *operandStack;
@end

@implementation CalculatorBrain

@synthesize operandStack=_operandStack;

//getter
-(NSMutableArray *)operandStack{
    if(_operandStack == nil) _operandStack = [[NSMutableArray alloc]init];
    return _operandStack;
}

//setter
-(void)setOperandStack:(NSMutableArray *)operandStack{
    _operandStack = operandStack;
}

-(void)pushOperand:(double)operand
{
    // first way
    //NSNumber *operandObject=[NSNumber numberWithDouble:operand];
    //[self.operandStack addObject:operandObject];
    
    // sconde way
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
    
}

-(void)performWaitingOperation
{
    if ([@"+" isEqualToString:waitingOperation]){
        operand = waitingOperand+operand;
    }else if ([@"-" isEqualToString:waitingOperation]){
        operand = waitingOperand-operand;
    }else if ([@"*" isEqualToString:waitingOperation]){
        operand = waitingOperand*operand;
    }else if ([@"/" isEqualToString:waitingOperation]){
        if (operand) {
           operand = waitingOperand/operand;
        }
        
    }
}

-(double)popOperand
{
    NSNumber *operandObject = [self.operandStack lastObject];
    if(operandObject) [self.operandStack removeLastObject];
    return [operandObject doubleValue];
}
/* CaculatorBrain.m */
-(double)performOperation:(NSString *)operation
{
    double result = 0;
    if([operation isEqualToString:@"+"]){
        result = [self popOperand]+[self popOperand];
    }else if([@"*" isEqualToString:operation]){
        result = [self popOperand]*[self popOperand];
    }else if([@"/" isEqualToString:operation]){
        result = [self popOperand]/[self popOperand];
    }
    
    [self pushOperand:result];
    
    return result;
}

@end
