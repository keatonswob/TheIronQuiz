//
//  RootViewController.m
//  TheIronQuiz
//
//  Created by Apple on 4/8/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "RootViewController.h"
#import "Quiz.h"
#import "CoreDataStack.h"

@interface RootViewController ()
{
    NSMutableArray *quizes;
    CoreDataStack *cdStack;
}
@end


@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // initialize our CoreDataStack model
    cdStack = [ CoreDataStack coreDataStackWithModelName:@"TheIronQuizModel" ];
               
    cdStack.coreDataStoreType = CDSStoreTypeSQL;
               
    quizes = [[NSMutableArray alloc]init];
    
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

    
    
    //here we need a delegate method for firbase to inform
    // us the firebase database has completed its download.
    
   // save
    // /////
    //  retrieve data
    //  update coredata
    
    //  restore data into our persistant model object
    
    Quiz *aQuiz = [ NSEntityDescription insertNewObjectForEntityForName:@"Quiz" inManagedObjectContext:cdStack.managedObjectContext ];  // model object aQuiz retrieved from core data stack.
    
    // aVenue.name = self.nameTextField.text;  // store the text name
    // aVenue.rating = [NSNumber numberWithFloat: self.ratingSlider.value];
    // aVenue.lat = [self.selectedVenue[@"location"][@"lat"];
    // aVenue.lng = [self.selectedVenue[@"location"][@"lng"];
    
    
    // /////
    // Core Data save routines
    
    [self saveCoreDataUpdates ];
    
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

@end
