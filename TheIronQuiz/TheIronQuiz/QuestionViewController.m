//
//  QuestionViewController.m
//  TheIronQuiz
//
//  Created by Apple on 4/8/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "QuestionViewController.h"
#import "QuizPickerTableViewController.h"
#import "AnswerModalViewController.h"
#import "Question.h"
#import "Choice.h"

@interface QuestionViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *answerTableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *nextButton;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;


@end

@implementation QuestionViewController
{
    NSMutableArray *questionArray;
    NSMutableArray *answerArray;
    NSInteger selectedAnswer;
    AnswerModalViewController *answerModalVC;
    Question *currentQuestion;
    NSEnumerator *questionEnumerator;

}

- (void)viewDidLoad {
    [super viewDidLoad];
//    QuestionViewController.delegate = self
    answerModalVC = [[AnswerModalViewController alloc] init];
//    self.QuestionViewController.delegate = self;
    self.answerTableView.delegate = self;
    self.answerTableView.dataSource = self;
    answerArray = [[NSMutableArray alloc] init];
    NSSet *questions = self.aQuiz.questions;
    questionEnumerator = [questions objectEnumerator];
    [self loadQuestion];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowAnswerSegue"])
    {
        AnswerModalViewController *answerModalViewC = (AnswerModalViewController *)[segue destinationViewController];
        
        switch (selectedAnswer)
        {
                case 0:
                    answerModalViewC.answer = @"A";
                break;
                
                case 1:
                    answerModalViewC.answer = @"B";
                break;
                
                case 2:
                    answerModalViewC.answer = @"C";
                break;
                
                case 3:
                    answerModalViewC.answer = @"D";
                break;
                
                case 4:
                    answerModalViewC.answer = @"E";
                break;
                
            default:
            break;
        }
}
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [answerArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AnswerCell" forIndexPath:indexPath];
    
    cell.textLabel.text = answerArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    selectedAnswer = indexPath.row;
}

- (IBAction)nextTapped:(UIBarButtonItem *)sender
{
    
    if ([self.nextButton.title isEqualToString:@"Done"])
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    [self loadQuestion];

}

- (void)loadQuestion
{

    
    currentQuestion = [questionEnumerator nextObject];
    /* code that acts on the set’s values */
    if (currentQuestion)
    {
    NSSet *aChoiceSet = currentQuestion.choices;
                
    NSEnumerator *enumeratorNext = [aChoiceSet objectEnumerator];
    Choice *aChoice;
    answerArray = nil;
    answerArray = [[NSMutableArray alloc] init];
    while ((aChoice = [enumeratorNext nextObject]))
    {
        NSString *aChoiceString = aChoice.text;
        [answerArray addObject:aChoiceString];
        /* code that acts on the set’s values */
    }

    
    
            
        
   // self.questionLabel.text = questionArray[currentQuestion];
    NSLog(@"%@", answerArray);
    self.questionLabel.text = currentQuestion.text;

        [self.answerTableView reloadData];
    }
    else
    {
        self.nextButton.title = @"Done";
        self.navigationItem.hidesBackButton = YES;

    }
}

//-(void)updateLabel
//{
//    answerModalVC.submitAnswerLabel.text = @"Aaa";
//}


    



@end
