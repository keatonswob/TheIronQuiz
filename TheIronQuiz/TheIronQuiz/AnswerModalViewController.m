//
//  AnswerModalViewController.m
//  TheIronQuiz
//
//  Created by Apple on 4/8/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "AnswerModalViewController.h"

@interface AnswerModalViewController ()

@end

@implementation AnswerModalViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    [self.delegate updateLabel];
//    AnswerModalViewController.delegate = self
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//-(void)updateLabel
//{
//    self.submitAnswerLabel.text = @"AAA";
//}

-(void)updateLabel:(NSString *)aString
{
    self.submitAnswerLabel.text = [NSString stringWithFormat:@"%@", aString];
}

- (IBAction)doneTapped:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
