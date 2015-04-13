//
//  RootViewController.m
//  TheIronQuiz
//
//  Created by Apple on 4/8/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "RootViewController.h"
#import "Quiz.h"
#import "Choice.h"
#import "Question.h"
#import "Topic.h"
#import "CoreDataStack.h"

#import <Firebase/Firebase.h>

@interface RootViewController ()
{
    NSMutableArray *quizes;
    CoreDataStack *cdStack;
    NSMutableArray *quizzes;
    NSString *quizOne;
    NSString *quizTwo;
    NSString *quiz;
}

@property (weak, nonatomic) IBOutlet UIButton *TIQSegueButton;


@end


@implementation RootViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // initialize our CoreDataStack model
    cdStack = [ CoreDataStack coreDataStackWithModelName:@"TheIronQuizModel"];
               
    cdStack.coreDataStoreType = CDSStoreTypeSQL;
               
    quizes = [[NSMutableArray alloc]init];
    
    [self fetchFirebaseData];
    
//    NSDictionary *answersAndQuestions = [questionArray objectAtIndex:currentQuestion];
//    NSString *answerOne = [answersAndQuestions objectForKey:@"AnswerOne"];
//    NSString *answerTwo = [answersAndQuestions objectForKey:@"AnswerTwo"];
//    NSString *answerThree = [answersAndQuestions objectForKey:@"AnswerThree"];
//    NSString *answerFour = [answersAndQuestions objectForKey:@"AnswerFour"];
//    NSString *correct = [answersAndQuestions objectForKey:@"Correct"];
//    NSString *question = [answersAndQuestions objectForKey:@"Question"];
//    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    NSFetchRequest *fetch;
    fetch = [[ NSFetchRequest alloc] init];
    
    
    // restore the quiz model
    
    // nab the handle to our model object
    NSEntityDescription *entity;
    entity = [NSEntityDescription entityForName:@"Quiz" inManagedObjectContext:cdStack.managedObjectContext];
    
    // init search criteria data from a persistent store
    fetch.entity = entity;
    
    // populate model from persistant data!
    quizes = nil;
    quizes = [[ cdStack.managedObjectContext executeFetchRequest:fetch error:nil] mutableCopy];
    // RCL: Are the Quizes the only thing we need to fetch from CoreData?
    
    
    //here we need a delegate method for firbase to inform
    // us the firebase database has completed its download.
    

    
}

#pragma mark - Core Data
    
- (void)saveCoreDataUpdates
{
    [cdStack saveOrFail:^(NSError *errorOrNil)
       {
         if (errorOrNil)
            {
                 NSLog(@"Error from CDStack: %@", [errorOrNil localizedDescription]);
             }
       }
         ];
}
    
    

- (void)didReceiveMemoryWarning
{
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


#pragma mark - Action Handlers

- (IBAction)TIQSegueButton:(UIButton *)sender
{
    // RCL: save info from Firebase here...
    // save
    // /////
    //  retrieve data
    //  update coredata
    
    //  restore data into our persistant model object
    
    Quiz *coreQuiz = [ NSEntityDescription insertNewObjectForEntityForName:@"Quiz" inManagedObjectContext:cdStack.managedObjectContext ];  // model object aQuiz retrieved from core data stack.
    Choice *coreChoice = [NSEntityDescription insertNewObjectForEntityForName:@"Choice" inManagedObjectContext:cdStack.managedObjectContext];
    Choice *coreChoice2 = [NSEntityDescription insertNewObjectForEntityForName:@"Choice" inManagedObjectContext:cdStack.managedObjectContext];
    Choice *coreChoice3 = [NSEntityDescription insertNewObjectForEntityForName:@"Choice" inManagedObjectContext:cdStack.managedObjectContext];
    Choice *coreChoice4 = [NSEntityDescription insertNewObjectForEntityForName:@"Choice" inManagedObjectContext:cdStack.managedObjectContext];
    Question *coreQuestion = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:cdStack.managedObjectContext];
    Topic *coreTopic = [NSEntityDescription insertNewObjectForEntityForName:@"Topic" inManagedObjectContext:cdStack.managedObjectContext];
    
    [self fetchFirebaseData];
    quizOne = [self.quizDictionary objectForKey:@"QuizJuan"];
    quizTwo = [self.quizDictionary objectForKey:@"QuizDos"];
    NSDictionary *quizone = [self.quizDictionary objectForKey:@"QuizOne"];
    NSDictionary *questions = [quizone objectForKey:@"Questions"];
    NSDictionary *questionOne = [questions objectForKey:@"QuestionOne"];
    NSString *answerone = [questionOne objectForKey:@"AnswerOne"];
    NSString *answertwo = [questionOne objectForKey:@"AnswerTwo"];
    NSString *answerthree = [questionOne objectForKey:@"AnswerThree"];
    NSString *answerfour = [questionOne objectForKey:@"AnswerFour"];
    NSString *questionText = [questionOne objectForKey:@"QuestionOne"];
    NSString *quizText = [self.quizDictionary objectForKey:@"QuizJuan"];
    
    coreQuiz.quiz = quizText;
    coreChoice.text = answerone;
    coreChoice2.text = answertwo;
    coreChoice3.text = answerthree;
    coreChoice4.text = answerfour;
    coreQuestion.text =questionText;
    
    
    
//    NSDictionary *quizNumber =  [self.quizDictionary objectForKey:self.quizName];
//    NSDictionary *questions = [quizNumber objectForKey:@"Questions"];
    //    [questionArray addObject:questions];
    
    
//    NSArray *allQuizKeys = [self.quizDictionary allKeys];
//    for (NSString *aKey in allQuizKeys)
//    {
//        NSString *aQuiz = [self.quizDictionary objectForKey:aKey];
//        [coreQuiz.quiz ]
//    }
//    
//    NSArray *allKeys = [questions allKeys];
//    for (NSString *aKey in allKeys)
//    {
//        NSString *aQuestion = [questions objectForKey:aKey];
//        [coreQuestion.question addObject:aQuestion];
//    }
    
    
    // RCL: may need to do some parsing here after we bring in Firebase to actually assign these values
    
    
//    aQuiz.questions
    
    // aQuiz.id = fb.id;
    // aQuiz.text = fb.text;
    
    // aVenue.name = self.nameTextField.text;  // store the text name
    // aVenue.rating = [NSNumber numberWithFloat: self.ratingSlider.value];
    // aVenue.lat = [self.selectedVenue[@"location"][@"lat"];
    // aVenue.lng = [self.selectedVenue[@"location"][@"lng"];
    
    
    // /////
    // Core Data save routines
//    if (self.objectfromfirebase)
//    {
    [self saveCoreDataUpdates];
//    }
    
}


-(void)fetchFirebaseData
{
    Firebase *fb = [[Firebase alloc] initWithUrl: @"https://theironquiz.firebaseio.com/Quizzes"];
    [fb observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
        NSLog(@"%@", snapshot.value);
        self.quizDictionary = snapshot.value;
        quizOne = [self.quizDictionary objectForKey:@"QuizJuan"];
        quizTwo = [self.quizDictionary objectForKey:@"QuizDos"];
        
        
        
    }];
    
    
}

@end
