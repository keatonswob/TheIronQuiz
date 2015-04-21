//
//  TeachersTVCell.h
//  TheIronQuiz
//
//  Created by Jim on 4/12/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeachersTVCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *saveTeacherQuestion;

@property (weak, nonatomic) IBOutlet UITextField *topicOfQuestion;
@property (weak, nonatomic) IBOutlet UITextView *questionText;
@property (weak, nonatomic) IBOutlet UITextField *teachersAnswerAToQuestion;
@property (weak, nonatomic) IBOutlet UITextField *teachersAnswerBToQuestion;

@property (weak, nonatomic) IBOutlet UITextField *teachersAnswerCToQuestion;


@property (weak, nonatomic) IBOutlet UITextField *teachersAnswerDToQuestion;
@end
