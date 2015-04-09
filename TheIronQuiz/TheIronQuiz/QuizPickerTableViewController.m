//
//  QuizPickerTableViewController.m
//  TheIronQuiz
//
//  Created by Apple on 4/8/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "QuizPickerTableViewController.h"
#import <Firebase/Firebase.h>

@interface QuizPickerTableViewController ()
{
    NSMutableArray *quizzes;
    NSDictionary *quizDictionary;
}

@end

@implementation QuizPickerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    quizzes = [[NSMutableArray alloc] init];
    quizDictionary = [[NSDictionary alloc] init];
    [self fetchFirebaseData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [quizzes count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QuizCell" forIndexPath:indexPath];
    cell.textLabel.text = quizzes[indexPath.row];
    
    
    return cell;
}

-(void)fetchFirebaseData
{
    Firebase *fb = [[Firebase alloc] initWithUrl: @"https://theironquiz.firebaseio.com/Quizzes"];
    [fb observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
        NSLog(@"%@", snapshot.value);
        quizDictionary = snapshot.value;
        NSString *quiz = [quizDictionary objectForKey:@"QuizJuan"];
        [quizzes addObject:quiz];
        [self.tableView reloadData];
    }];
    
    
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

@end
