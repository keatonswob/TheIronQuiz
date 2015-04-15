//
//  TeachersViewController.m
//  TheIronQuiz
//
//  Created by Jim on 4/12/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "TeachersViewController.h"
#import "QuestionViewController.h"  // aQuiz
#import "TeachersTVCell.h"
#import "Quiz.h"
#import "Question.h"
#import "Choice.h"
#import "Topic.h"


#define kOne;



@interface TeachersViewController () <UITextFieldDelegate>

{
    
    NSMutableArray *teachersQuestions;
    NSMutableArray *teachersChoices;
    NSMutableArray *teachersTopics;
    NSMutableDictionary   *fourChoices;
    
    NSMutableArray *questionArray;
    NSMutableArray *answerArray;
    
}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveTeacherQuestion;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addTeacherQuestion;
@property (weak, nonatomic) IBOutlet UITextField *quizID;


@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelQuestion;

@end

@implementation TeachersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    teachersQuestions = [[NSMutableArray alloc]init];
    teachersChoices = [[NSMutableArray alloc]init];
    teachersTopics = [[NSMutableArray alloc]init];
    fourChoices = [[NSDictionary alloc]init];
    
    questionArray = [[NSMutableArray alloc] init];
    answerArray = [[NSMutableArray alloc] init];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [teachersQuestions count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    TeachersTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TeachersTVCell" forIndexPath:indexPath];
    
    // we now have a cell,  this cell has six text fields
    // Configure the cell...
   
    Topic *aTopic = teachersTopics[indexPath.row];  //one topic
    Question *aQuestion = teachersQuestions[indexPath.row];//one question
    Choice *aChoice = teachersChoices[indexPath.row]; // four choices
    
//    UITextField *topicTextField = (UITextField *)[cell topicOfQuestion]; //description text field
//    UITextField *teachersQuestionTextField = (UITextField *)[cell questionText ]; //description text field
//    UITextField *teachersAnswerATextField = (UITextField *)[cell teachersAnswerAToQuestion]; //description text field
//    UITextField *teachersAnswerBtextField = (UITextField *)[cell teachersAnswerBToQuestion]; //description text field
//    UITextField *teachersAnswerCtextField = (UITextField *)[cell teachersAnswerCToQuestion]; //description text field
//    UITextField *teachersAnswerDtextField = (UITextField *)[cell teachersAnswerDToQuestion]; //description text field
//    
//    [topicTextField becomeFirstResponder];
   
    // or similar to TIY in class lessons
    
    if( [ aTopic.text isEqualToString:@""] )
    {
        
       // first textField, the topic, is blank,
       // set keyboard to this field
    
        [cell.topicOfQuestion becomeFirstResponder];
    }
    else
    {
        // fill the cell with the topic
        
        [cell.topicOfQuestion setText:aTopic.text];
    }
   
    
    
    // teacherQuestions is an array consisting of
    //   aQuestion.quiz = self.aQuiz;
    
    cell.questionText = aQuestion.text;
   
    
    // cell.topicOfQuestion.text = aQuiz.?;
    
    aChoice.question = aQuestion;
    
//    cell.teachersAnswerAToQuestion.text = aQuestion.choice.text;
//    cell.teachersAnswerAToQuestion.text  = @"123";
//    cell.teachersAnswerAToQuestion.text  = aQuestion.choices.;
//      cell.teachersAnswerBToQuestion.text
//    = aQuestion.choices.question.choice.text;
//    cell.teachersAnswerCToQuestion.text =
//    cell.teachersAnswerDToQuestion.text =
    
//    City *aCity = cities[indexPath.row];
//   cell.cityNameLabel.text = aCity.name;
//    if (aCity.currentWeather)
//    {
//        cell.currentConditionsSummaryLabel.text = aCity.currentWeather.summary;
//        cell.currentTemperatureLabel.text = [aCity.currentWeather currentTemperature];
//    }
    
    //similar to this, but, we have a custom cell.
////    NSString *itemList = resultsArray[indexPath.row];
    //    NSString *addressList = resultsArray[1][indexPath.row];
    
////    cell.textLabel.text = itemList;
    //    cell.detailTextLabel.text = addressList;
    
    return cell;
}
//scratch pad
//
//NSMutableArray *questionArray;
//NSMutableArray *answerArray;
//NSInteger currentQuestion;
//NSInteger selectedAnswer;
//AnswerModalViewController *answerModalVC;
//}
//
////- (void)viewDidLoad {
////    [super viewDidLoad];
//    //    QuestionViewController.delegate = self
////  answerModalVC = [[AnswerModalViewController alloc] init];
//    //    self.QuestionViewController.delegate = self;
////    self.answerTableView.delegate = self;
////    self.answerTableView.dataSource = self;
//
//    questionArray = [[NSMutableArray alloc] init];
//    answerArray = [[NSMutableArray alloc] init];
//    currentQuestion = 0;
//
//    Question *aQuestion = [[Question alloc] init];
//
//    aQuestion.quiz = self.aQuiz;
//    self.questionLabel.text = aQuestion.text;
//
//    Choice *aChoice = [[Choice alloc] init];
//    aChoice.question = aQuestion;
//    
//
//// end of scratch pad

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark -textfield delegates

//-(BOOL)textFieldShouldReturn:(UITextField *)textField
//{
//    // user has pressed a return in some field
//    // now do this:
//    
//    BOOL rc = NO;
//    
//    UIView *contentView = [textField superview];
//       
//    // what cell are we in, what is its path?
//    // (assuming we are only inputing text in this cell)
//    
//    TeachersTVCell *cell = (TeachersTVCell *)[contentView superview];
//    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
//    
//        
//    Question *aQuestion = teachersQuestions[indexPath.row];//one question
//    Choice *aChoice = teachersChoices[indexPath.row]; // four choices
//  
//    // shift keyboard input to the name textfield
//    //ugg, "text view" does not have a place holder options in sboard
//    // this will not work until placeholder is somehow set.
//    if ([textField.placeholder isEqualToString:@"Question"])
//       {
//           if([textField.text isEqualToString:@""])
//           {
//              [cell.questionText becomeFirstResponder];
//           }
//           else
//           {
//               // if not the question text field,
//               // update the question text.
//               // and resign the keyboard
//               
//               aQuestion.text = textField.text;
//                
//               rc = YES; // yes, text in a textfield completed
//                    
//               [textField resignFirstResponder];
//                   
//               // save changes to core data
//                    
//               // [self saveCoreDataUpdates];
//               
//           }
//       }
//    else if([textField.placeholder isEqualToString:@"Answer A"])
//       {
//           if([textField.text isEqualToString:@""])
//               {
//                   [cell.teachersAnswerAToQuestion becomeFirstResponder];
//               }
//               else
//               {
//                  //  aChoice.text = textField.text;
//                   [fourChoices setObject:textField forKey:@"A"];
//                   
//                   // marker1
//                    rc = YES;  //yes we have text in field
//                    [textField resignFirstResponder];
//                    
//                    // save changes to core data
//                    
//                   // self saveCoreDataUpdates];
//               }
//       }
//    else if([textField.placeholder isEqualToString:@"Answer B"])
//       {
//            if([textField.text isEqualToString:@""])
//               {
//                   [cell.teachersAnswerBToQuestion becomeFirstResponder];
//               }
//               else
//               {
//                   aChoice.text = textField.text;
//                   rc = YES;  //yes we have text in field
//                   [textField resignFirstResponder];
//                    
//                   // save changes to core data
//                    
//                   // self saveCoreDataUpdates];
//               }
//       }
//    else if([textField.placeholder isEqualToString:@"Answer C"])
//       {
//           if([textField.text isEqualToString:@""])
//           {
//              [cell.teachersAnswerCToQuestion becomeFirstResponder];
//           }
//           else
//           {
//              aChoice.text = textField.text;
//              rc = YES;  //yes we have text in field
//              [textField resignFirstResponder];
//               
//               // save changes to core data
//               //  [self saveCoreDataUpdates];
//           }
//       }
//    else if([textField.placeholder isEqualToString:@"Answer D"])
//       {
//           if([textField.text isEqualToString:@""])
//           {
//              [cell.teachersAnswerDToQuestion becomeFirstResponder];
//           }
//           else
//           {
//               aChoice.text = textField.text;
//               rc = YES;  //yes we have text in field
//               [textField resignFirstResponder];
//               
//                // save changes to core data
//                    
//                // [self saveCoreDataUpdates];
//           }
//       }
//                 
//    }
//    
//    return rc;
//}

@end
