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
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;


@end

@implementation QuestionViewController
{
    NSMutableArray *questionArray;
    NSMutableArray *answerArray;
    NSInteger currentQuestion;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.answerTableView.delegate = self;
    self.answerTableView.dataSource = self;
    questionArray = [[NSMutableArray alloc] init];
    answerArray = [[NSMutableArray alloc] init];
    currentQuestion = 0;
    NSDictionary *quizNumber =  [self.questionDictionary objectForKey:self.quizName];
    NSDictionary *questions = [quizNumber objectForKey:@"Questions"];
//    [questionArray addObject:questions];
    NSArray *allKeys = [questions allKeys];
    for (NSString *aKey in allKeys)
    {
        NSDictionary *aQuestion = [questions objectForKey:aKey];
        [questionArray addObject:aQuestion];
    }

    [self loadQuestion];
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
    currentQuestion++;
    if (currentQuestion < [questionArray count])
    {
        [answerArray removeAllObjects];
        [self loadQuestion];
    }
    else
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)loadQuestion
{
    
    NSDictionary *answersAndQuestions = [questionArray objectAtIndex:currentQuestion];
//        NSString *answerOne = [answersAndQuestions objectForKey:@"AnswerOne"];
//        NSString *answerTwo = [answersAndQuestions objectForKey:@"AnswerTwo"];
//        NSString *answerThree = [answersAndQuestions objectForKey:@"AnswerThree"];
//        NSString *answerFour = [answersAndQuestions objectForKey:@"AnswerFour"];
    NSString *question = [answersAndQuestions objectForKey:@"Question"];
    
    NSArray *allKeys = [answersAndQuestions allKeys];
    for (NSString *aKey in allKeys)
    {
        NSString *aChoice = [answersAndQuestions objectForKey:aKey];
        if ([aKey containsString:@"Answer"])
        {
            [answerArray addObject:aChoice];
        }
    }
    
        self.questionLabel.text = question;
        [self.answerTableView reloadData];
}


    



@end
