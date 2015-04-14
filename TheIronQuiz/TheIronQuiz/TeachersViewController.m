//
//  TeachersViewController.m
//  TheIronQuiz
//
//  Created by Jim on 4/12/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "TeachersViewController.h"
#import "TeachersTVCell.h"
#import "Quiz.h"
#import "Question.h"
#import "Choice.h"


@interface TeachersViewController () <UITextFieldDelegate>

{
    
    NSMutableArray *teachersQuestions;
    
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

// step one.. change class of cell from .. to TeachersTVCell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TeachersTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TeachersTVCell" forIndexPath:indexPath];
    
    // Configure the cell...
    // similar to this too
   
    // teacherQuestions is an array consisting of
    
      Question *aQuestion = teachersQuestions[indexPath.row];
//      aQuestion.text =
//    aQuestion.choices.text =
//    
//    cell.topicOfQuestion.text =
//    cell.teachersAnswerAToQuestion.text =
//    cell.teachersAnswerBToQuestion.text =
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

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    BOOL rc = NO;
    
    if (![textField.text isEqualToString:@""]) //we have txt
    {
        [textField resignFirstResponder];
        rc = YES;
        
        UIView *contentView = [textField superview];
        
        UITableViewCell *cell = (UITableViewCell *)[contentView superview];
        NSIndexPath *path = [self.tableView indexPathForCell:cell];
        
        TodoItem *anItem = todoItems[path.row];
        anItem.title = textField.text;
        
    }
    
    return rc;
}

@end
