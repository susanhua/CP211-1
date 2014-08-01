//
//  SSCalculatorBrain.h
//  Calculator
//
//  Created by susan hua on 14-7-27.
//  Copyright (c) 2014年 susan hua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSCalculatorBrain : NSObject{
    double operand;
    double waitingOperand;
    NSString* waitingOperator;
}//私有变量 外部看不到的
-(void)setOperand:(double)value;//外部可以设置这个值
-(double)performOperator:(NSString*)operator;//外部输入操作符进行计算
@end
