//
//  PXViewController.m
//  Calculator
//
//  Created by MilesChen on 7/27/14.
//  Copyright (c) 2014 MilesChen. All rights reserved.
//

#import "PXViewController.h"
#import "PXCaculatorBrain.h"

@interface PXViewController () {

    PXCaculatorBrain *_brain;
    BOOL userIsTypingNumber;
    BOOL userIsTypingRedo;
}


@property (strong, nonatomic) IBOutlet UILabel *display;



- (IBAction)digitPressed:(UIButton *)sender;

- (IBAction)operatorPressed:(UIButton *)sender;


@end


@implementation PXViewController

- (PXCaculatorBrain *)brain{
    if(!_brain) _brain = [[PXCaculatorBrain alloc] init];
    return _brain;
}

- (void)reset{
    [[self brain] reset];
    userIsTypingNumber = NO;
    userIsTypingRedo = NO;
    [_display setText:(@"0")];
    
}

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
    NSLog(@"digit%@pressed", [[sender titleLabel] text]);
    NSString *digit = [[sender titleLabel] text];
    if (userIsTypingNumber) {
        [_display setText:[[_display text] stringByAppendingString:digit]];
    } else {
        [_display setText:digit];
        userIsTypingNumber = YES;
    }
}

- (IBAction)operatorPressed:(UIButton *)sender {
    NSLog(@"oprator%@pressed", [[sender titleLabel] text]);
    NSString* operator = [[sender titleLabel] text];
    if ([operator isEqualToString:@"C"]) {
        [self reset];
        return;
    }
    
    if (userIsTypingNumber) {
        [[self brain] setOperand:[[_display text] doubleValue]];
        userIsTypingNumber = NO;
        
    } else {
        NSLog(@"Error Input");
        if ([operator isEqualToString:@"="] || [operator isEqualToString:@"+/-"]||[operator isEqualToString:@"sqrt"]) {
            [[self brain] setOperand:[[_display text] doubleValue]];
        }   else {
            [[self brain] setOperator:operator];
            return;
        }
    }
    
    double result = [[self brain] perfomOperator:operator];
    [_display setText:[NSString stringWithFormat:@"%g", result]];
    
}
@end
