//
//  SSViewController.m
//  Calculator
//
//  Created by susan hua on 14-7-27.
//  Copyright (c) 2014年 susan hua. All rights reserved.
//

#import "SSViewController.h"
#import "SSCalculatorBrain.h"

@interface SSViewController (){
    SSCalculatorBrain *_brain;//私有变量
    BOOL userIsTypingNumber; //状态变量，model和controller之间的交互
}

@property (weak, nonatomic) IBOutlet UILabel *display;//数字显示屏幕

- (IBAction)digitPressed:(UIButton *)sender;
  //-方法（返回值）函数名字（类型）指针作为输入给这个方法

- (IBAction)operationPressed:(UIButton *)sender;

@end

@implementation SSViewController

-(SSCalculatorBrain *)brain{
    if (!_brain) _brain = [[SSCalculatorBrain alloc] init];
    return _brain;
}//如果它是空的，创建brain （初始化）

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)digitPressed:(UIButton *)sender {
    NSLog(@"Digit %@ pressed.", [[sender titleLabel]text]);//sender就是按钮
    
    NSString *digit = [[sender titleLabel] text];
    if (userIsTypingNumber){
        [_display setText:[[_display text]stringByAppendingString:digit]];
         }//把屏幕显示的内容先拿下来再加在后面
         else {
            [_display setText:digit];
             userIsTypingNumber = YES;
            }
    }
- (IBAction)operationPressed:(UIButton *)sender {
    NSLog(@"Operator %@ pressed.", [[sender titleLabel]text]);
    
    if (userIsTypingNumber){
        [[self brain] setOperand:[[_display text]doubleValue]];//从显示屏上取text
        userIsTypingNumber = NO;
         } //终于收到符号，之前的所有操作数传给model
         else {
            NSLog (@"ERROR! Double operators!");
         }

    NSString *operator = [[sender titleLabel]text];
         double result = [[self brain]performOperator:operator];
    [_display setText:[NSString stringWithFormat:@"%g",result]];//把算出来的表达式送给display
}
@end
