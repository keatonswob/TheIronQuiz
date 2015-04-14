//
//  QuestionViewController.h
//  TheIronQuiz
//
//  Created by Apple on 4/8/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnswerModalViewController.h"
#import "Quiz.h"


@interface QuestionViewController : UIViewController



@property(strong, nonatomic) NSDictionary *questionDictionary;
@property(strong, nonatomic) Quiz *aQuiz;
@end
