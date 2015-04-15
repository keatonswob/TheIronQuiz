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

   
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

  
    

    
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

    
//    Quiz *coreQuiz = [NSEntityDescription insertNewObjectForEntityForName:@"Quiz" inManagedObjectContext:cdStack.managedObjectContext];  // model object aQuiz retrieved from core data stack.
//    Question *coreQuestion = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:cdStack.managedObjectContext];
//    coreQuestion.quiz = coreQuiz;
//    Choice *coreChoice = [NSEntityDescription insertNewObjectForEntityForName:@"Choice" inManagedObjectContext:cdStack.managedObjectContext];
//    coreChoice.question = coreQuestion;
//    Choice *coreChoice2 = [NSEntityDescription insertNewObjectForEntityForName:@"Choice" inManagedObjectContext:cdStack.managedObjectContext];
//    coreChoice2.question = coreQuestion;
//    Choice *coreChoice3 = [NSEntityDescription insertNewObjectForEntityForName:@"Choice" inManagedObjectContext:cdStack.managedObjectContext];
//    coreChoice3.question = coreQuestion;
//    Choice *coreChoice4 = [NSEntityDescription insertNewObjectForEntityForName:@"Choice" inManagedObjectContext:cdStack.managedObjectContext];
//    coreChoice4.question = coreQuestion;

//    Topic *coreTopic = [NSEntityDescription insertNewObjectForEntityForName:@"Topic" inManagedObjectContext:cdStack.managedObjectContext];
//    coreTopic.quiz = coreQuiz;
    
    
//
//    NSDictionary *quizone = [self.quizDictionary objectForKey:@"QuizOne"];
//    NSDictionary *questions = [quizone objectForKey:@"Questions"];
//    NSDictionary *questionOne = [questions objectForKey:@"QuestionOne"];
//    NSString *answerone = [questionOne objectForKey:@"AnswerOne"];
//    NSString *answertwo = [questionOne objectForKey:@"AnswerTwo"];
//    NSString *answerthree = [questionOne objectForKey:@"AnswerThree"];
//    NSString *answerfour = [questionOne objectForKey:@"AnswerFour"];
//    NSString *questionText = [questionOne objectForKey:@"Question"];
//    NSString *quizText = [self.quizDictionary objectForKey:@"QuizJuan"];
//    
//    
//    coreQuiz.quiz = quizText;
//    coreChoice.text = answerone;
//    coreChoice2.text = answertwo;
//    coreChoice3.text = answerthree;
//    coreChoice4.text = answerfour;
//    coreQuestion.text =questionText;
    
    
    
//    NSDictionary *quizNumber =  [self.quizDictionary objectForKey:self.quizName];
//    NSDictionary *questions = [quizNumber objectForKey:@"Questions"];
    //    [questionArray addObject:questions];
    
    
    NSArray *allQuizKeys = [self.quizDictionary allKeys];
    for (NSString *aKey in allQuizKeys)
    {
        NSDictionary *aQuiz = [self.quizDictionary objectForKey:aKey];
        Quiz *coreQuiz = [NSEntityDescription insertNewObjectForEntityForName:@"Quiz" inManagedObjectContext:cdStack.managedObjectContext];
        coreQuiz.quiz = aKey;

        NSDictionary *questions = [aQuiz objectForKey:@"Questions"];
        NSArray *allQuestionKeys = [questions allKeys];
        for (NSString *aKey in allQuestionKeys)
        {
            NSDictionary *aQuestion = [questions objectForKey:aKey];
            Question *coreQuestion = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:cdStack.managedObjectContext];
            NSArray *allAnswerKeys = [aQuestion allKeys];
            
            for (NSString *aQuestionOrAnswer in allAnswerKeys)
            {
                if ([aQuestionOrAnswer isEqualToString:@"Question"])
                {
                    NSString *questionText = [aQuestion objectForKey:aQuestionOrAnswer];
                    NSLog(@"%@ here be questionText", questionText);
                    coreQuestion.text = questionText;
                }
                else
                {
                    NSString *choiceText = [aQuestion objectForKey:aQuestionOrAnswer];
                    Choice *coreChoice = [NSEntityDescription insertNewObjectForEntityForName:@"Choice" inManagedObjectContext:cdStack.managedObjectContext];
                    NSLog(@"%@ here be choiceText", choiceText);
                    coreChoice.text = choiceText;
                }
            }
        }
    }

    [self saveCoreDataUpdates];

    
    
    
    
    
}


-(void)fetchFirebaseData
{
    Firebase *fb = [[Firebase alloc] initWithUrl: @"https://theironquiz.firebaseio.com/Quizzes"];
    [fb observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
        self.quizDictionary = snapshot.value;
//        quizOne = [self.quizDictionary objectForKey:@"QuizJuan"];
//        quizTwo = [self.quizDictionary objectForKey:@"QuizDos"];
        
        
        
    }];
    
    
}

@end
