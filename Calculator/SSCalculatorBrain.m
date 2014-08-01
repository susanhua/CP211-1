//
//  SSCalculatorBrain.m
//  Calculator
//
//  Created by susan hua on 14-7-27.
//  Copyright (c) 2014年 susan hua. All rights reserved.
//

#import "SSCalculatorBrain.h"

@implementation SSCalculatorBrain
-(void)setOperand:(double)value{
    operand = value;
} //设置成外面传进来的这个值

-(void)performWaitingOperator{
    if ([@"+" isEqualToString:waitingOperator]) {
        operand = waitingOperand + operand;
    }//如果原来保存的操作符是＋，做计算
    else if([@"-" isEqualToString:waitingOperator]) {
        operand = waitingOperand - operand;
    }
    else if([@"*" isEqualToString:waitingOperator]) {
        operand = waitingOperand * operand;
    }
    else if([@"/" isEqualToString:waitingOperator]) {
        operand = waitingOperand / operand;
    }
}

-(double)performOperator:(NSString*)operator{
    if ([operator isEqualToString:@"sqrt"]) {
        operand = sqrt(operand);
    } else {
        [self performWaitingOperator];
        waitingOperator = operator;
        waitingOperand = operand;
    }//判断之前是否有操作数，如果有操作掉，如果没有等数字和下一个操作符进入时再计算
    return operand;
}
@end

