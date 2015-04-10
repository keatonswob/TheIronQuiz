// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Question.h instead.

#import <CoreData/CoreData.h>

extern const struct QuestionAttributes {
	__unsafe_unretained NSString *question;
	__unsafe_unretained NSString *text;
} QuestionAttributes;

extern const struct QuestionRelationships {
	__unsafe_unretained NSString *choices;
	__unsafe_unretained NSString *quiz;
} QuestionRelationships;

@class Choice;
@class Quiz;

@interface QuestionID : NSManagedObjectID {}
@end

@interface _Question : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) QuestionID* objectID;

@property (nonatomic, strong) NSString* question;

//- (BOOL)validateQuestion:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* text;

//- (BOOL)validateText:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *choices;

- (NSMutableSet*)choicesSet;

@property (nonatomic, strong) Quiz *quiz;

//- (BOOL)validateQuiz:(id*)value_ error:(NSError**)error_;

@end

@interface _Question (ChoicesCoreDataGeneratedAccessors)
- (void)addChoices:(NSSet*)value_;
- (void)removeChoices:(NSSet*)value_;
- (void)addChoicesObject:(Choice*)value_;
- (void)removeChoicesObject:(Choice*)value_;

@end

@interface _Question (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveQuestion;
- (void)setPrimitiveQuestion:(NSString*)value;

- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;

- (NSMutableSet*)primitiveChoices;
- (void)setPrimitiveChoices:(NSMutableSet*)value;

- (Quiz*)primitiveQuiz;
- (void)setPrimitiveQuiz:(Quiz*)value;

@end
