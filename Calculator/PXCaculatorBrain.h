//
//  PXCaculatorBrain.h
//  Calculator
//
//  Created by MilesChen on 7/27/14.
//  Copyright (c) 2014 MilesChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PXCaculatorBrain : NSObject{

    double operand;
    double waitingOperand;
    NSString* waitingOperator;
    
}



- (void)setOperand:(double)value;
- (double)perfomOperator:(NSString *)operator;
- (void)reset;
- (void)setOperator:(NSString *)operator;
@end
