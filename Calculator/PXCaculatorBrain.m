//
//  PXCaculatorBrain.m
//  Calculator
//
//  Created by MilesChen on 7/27/14.
//  Copyright (c) 2014 MilesChen. All rights reserved.
//

#import "PXCaculatorBrain.h"

@implementation PXCaculatorBrain


- (void)setOperand:(double)value
{
    operand = value;
}

- (void)performWaitingOperator
{
    if ([@"+" isEqualToString:waitingOperator]) {
        operand = waitingOperand + operand;
    } else if ([@"-" isEqualToString:waitingOperator]) {
        operand = waitingOperand - operand;
    } else if ([@"*" isEqualToString:waitingOperator]) {
        operand = waitingOperand * operand;
    } else if ([@"/" isEqualToString:waitingOperator]) {
        operand = waitingOperand / operand;
    }
}

- (double)perfomOperator:(NSString *)operator
{
    if ([operator isEqualToString:@"sqrt"]) {
        operand = sqrt(operand);
    } else if ([operator isEqualToString:@"+/-"]){
        operand = -operand;
    } else if ([operator isEqualToString:@"="]){
        [self performWaitingOperator];
        waitingOperator = nil;
    } else {
        
        [self performWaitingOperator];
        waitingOperator = operator;
    }
    waitingOperand = operand;
    operand = 0;

    return waitingOperand;
}

- (void)reset{
    operand = 0;
    waitingOperand = 0;
    waitingOperator = nil;
}

- (void)setOperator:(NSString *)operator
{
    waitingOperator = operator;
}
@end
