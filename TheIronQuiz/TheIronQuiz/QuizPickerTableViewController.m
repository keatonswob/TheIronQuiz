//
//  QuizPickerTableViewController.m
//  TheIronQuiz
//
//  Created by Apple on 4/8/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "QuizPickerTableViewController.h"
#import "QuestionViewController.h"
#import "CoreDataStack.h"
#import "Quiz.h"

#import <Firebase/Firebase.h>

@interface QuizPickerTableViewController ()
{
    NSMutableArray *quizzes;
//    NSString *quizOne;
//    NSString *quizTwo;
//    NSString *quiz;
    CoreDataStack *cdStack;
    
    
}

@end

@implementation QuizPickerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    quizzes = [[NSMutableArray alloc] init];
//    quizOne = [[NSString alloc] init];
//    quizTwo = [[NSString alloc] init];
//    quiz = [[NSString alloc] init];
    
    cdStack = [ CoreDataStack coreDataStackWithModelName:@"TheIronQuizModel"];
    
    cdStack.coreDataStoreType = CDSStoreTypeSQL;
  
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Quiz" inManagedObjectContext:cdStack.managedObjectContext];
    [fetchRequest setEntity:entity];
//    quizzes = nil;
    quizzes = [[cdStack.managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    [self.tableView reloadData];
   
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)viewWillAppear:(BOOL)animated
//{
//    {
//        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
//        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Quiz" inManagedObjectContext:cdStack.managedObjectContext];
//        [fetchRequest setEntity:entity];
//        quizzes = nil;
//        quizzes = [[cdStack.managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
//        [self.tableView reloadData];
//    }
//}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [quizzes count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QuizCell" forIndexPath:indexPath];
    Quiz *aQuiz = quizzes[indexPath.row];
    cell.textLabel.text = aQuiz.quiz;
    
    return cell;
}
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    quiz = cell.textLabel.text;
//    
//}
//





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



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"QuestionViewControllerSegue"])
    {
       
        UITableViewCell *cell = sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        Quiz *aQuiz = quizzes[indexPath.row];
        
        UINavigationController *navC = [segue destinationViewController];
        QuestionViewController *questionVC = [navC viewControllers][0];
        questionVC.aQuiz = aQuiz;
        
        
        
        
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
