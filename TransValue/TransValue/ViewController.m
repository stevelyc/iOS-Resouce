//
//  ViewController.m
//  TransValue
//
//  Created by apple on 15/7/9.
//  Copyright (c) 2015年 iCumpus. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)press:(UIButton *)sender {
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"abc"]) {
        TextfieldViewController *vc = (TextfieldViewController *)segue.destinationViewController;
        vc.str = self.inputTextField.text;
    }
}

@end
