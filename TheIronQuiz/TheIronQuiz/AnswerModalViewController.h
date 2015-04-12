//
//  AnswerModalViewController.h
//  TheIronQuiz
//
//  Created by Apple on 4/8/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol QuestionViewControllerDelegate


-(void)updateLabel:(NSString *)aString;

@end


@interface AnswerModalViewController : UIViewController <QuestionViewControllerDelegate>


@property (weak, nonatomic) IBOutlet UILabel *submitAnswerLabel;

@end


