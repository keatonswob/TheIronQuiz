//
//  QuestionViewController.m
//  TheIronQuiz
//
//  Created by Apple on 4/8/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "QuestionViewController.h"
#import "QuizPickerTableViewController.h"

@interface QuestionViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *answerTableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *nextButton;
@property (weak, nonatomic) IBOutlet UITextView *questionTextView;


@end

@implementation QuestionViewController
{
    NSMutableArray *answerArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.answerTableView.delegate = self;
    self.answerTableView.dataSource = self;
    answerArray = [[NSMutableArray alloc] init];
    NSDictionary *quizOne =  [self.questionDictionary objectForKey:@"QuizOne"];
    NSDictionary *questions = [quizOne objectForKey:@"Questions"];
    NSDictionary *answersAndQuestions = [questions objectForKey:@"QuestionOne"];
    NSString *answerOne = [answersAndQuestions objectForKey:@"AnswerOne"];
    NSString *answerTwo = [answersAndQuestions objectForKey:@"AnswerTwo"];
    NSString *answerThree = [answersAndQuestions objectForKey:@"AnswerThree"];
    NSString *answerFour = [answersAndQuestions objectForKey:@"AnswerFour"];
    NSString *question = [answersAndQuestions objectForKey:@"Question"];
    [answerArray addObject:answerOne];
    [answerArray addObject:answerTwo];
    [answerArray addObject:answerThree];
    [answerArray addObject:answerFour];
    self.questionTextView.text = question;
    
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [answerArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AnswerCell" forIndexPath:indexPath];
    
    cell.textLabel.text = answerArray[indexPath.row];
    
    return cell;
}
- (IBAction)nextTapped:(UIBarButtonItem *)sender
{
    
    
    
    
}


@end
