//
//  AnswerModalViewController.h
//  TheIronQuiz
//
//  Created by Apple on 4/8/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionViewController.h"




@interface AnswerModalViewController : UIViewController<AnswerModalViewControllerDelegate>


@property (weak, nonatomic) IBOutlet UILabel *submitAnswerLabel;

@end


