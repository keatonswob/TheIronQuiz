//
//  AnswerModalViewController.h
//  TheIronQuiz
//
//  Created by Apple on 4/8/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>





@interface AnswerModalViewController : UIViewController 

@property (nonatomic) NSString *answer;
@property (weak, nonatomic) IBOutlet UILabel *submitAnswerLabel;

@end


