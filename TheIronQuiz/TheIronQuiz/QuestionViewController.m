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
    AnswerModalViewController *answerModalVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    QuestionViewController.delegate = self
    answerModalVC = [[AnswerModalViewController alloc] init];
//    self.QuestionViewController.delegate = self;
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
    
    
//    [self.delegate updateLabel:@"A"];
    [self loadQuestion];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([segue.identifier isEqualToString:@"ShowWinningTicketSegue"])
//    {
//        AnswerModalViewController *answerModalViewC = (AnswerModalViewController *)[segue destinationViewController];
//        answerModalViewC.delegate = self; //do work
//    }
//}


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
    
    
    
//    static NSString *CellIdentifier = @"AnswerCell";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil)
//    {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//    }
    
    cell.textLabel.text = answerArray[indexPath.row];
    

        
    if ([indexPath row] == 0)
    {
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//
//        UIView *bgColorView = [[UIView alloc] init];
//        bgColorView.layer.cornerRadius = 7;
//        bgColorView.layer.masksToBounds = YES;
//        [bgColorView setBackgroundColor:[UIColor colorWithRed:.85 green:0 blue:0 alpha:1]];
//        [cell setSelectedBackgroundView:bgColorView];
//        
//        UIColor *backColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:1];
//        cell.backgroundColor = backColor;
//        UIColor *foreColor = [UIColor colorWithWhite:1 alpha:1];
//        cell.textLabel.textColor = foreColor;
//        
//        cell.textLabel.text = @"row0";
//        answerModalVC.submitAnswerLabel.text = @"Aaaa";
//        [answerModalVC updateLabel:@"A"].delegate = self;
//    }
//    else if ([indexPath row] == 1)
//    {
//        [self.delegate updateLabel:@"B"];
//    }
//    else if ([indexPath row] == 2)
//    {
//        [self.delegate updateLabel:@"C"];
//    }
//    else if ([indexPath row] == 3)
//    {
//        [self.delegate updateLabel:@"D"];
//    }
//    else if ([indexPath row] == 4)
//    {
//        [self.delegate updateLabel:@"E"];
}
    
    return cell;
}

- (IBAction)nextTapped:(UIBarButtonItem *)sender
{
    self.navigationItem.hidesBackButton = YES;
    currentQuestion++;
    if (currentQuestion < [questionArray count])
    {
        [answerArray removeAllObjects];
        [self loadQuestion];
    }
    else
    {
        [self.navigationController popViewControllerAnimated:YES];
//        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

- (void)loadQuestion
{
    NSDictionary *answersAndQuestions = [questionArray objectAtIndex:currentQuestion];
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

//-(void)updateLabel
//{
//    answerModalVC.submitAnswerLabel.text = @"Aaa";
//}


    



@end
