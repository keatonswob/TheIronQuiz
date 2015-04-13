//
//  TeachersTVCell.m
//  TheIronQuiz
//
//  Created by Jim on 4/12/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "TeachersTVCell.h"

@implementation TeachersTVCell

- (void)awakeFromNib {
    // Initialization code
    self.topicOfQuestion.text = @"";
    self.questionText.text = @"";
    self.teachersAnswerAToQuestion.text = @"";
    self.teachersAnswerBToQuestion.text = @"";
    self.teachersAnswerCToQuestion.text = @"";
    self.teachersAnswerDToQuestion.text = @"";
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
