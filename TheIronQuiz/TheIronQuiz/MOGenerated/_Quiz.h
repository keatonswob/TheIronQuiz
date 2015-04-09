// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Quiz.h instead.

#import <CoreData/CoreData.h>

extern const struct QuizAttributes {
	__unsafe_unretained NSString *id;
} QuizAttributes;

extern const struct QuizRelationships {
	__unsafe_unretained NSString *questions;
	__unsafe_unretained NSString *topics;
} QuizRelationships;

@class Question;
@class Topic;

@interface QuizID : NSManagedObjectID {}
@end

@interface _Quiz : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) QuizID* objectID;

@property (nonatomic, strong) NSString* id;

//- (BOOL)validateId:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *questions;

- (NSMutableSet*)questionsSet;

@property (nonatomic, strong) NSSet *topics;

- (NSMutableSet*)topicsSet;

@end

@interface _Quiz (QuestionsCoreDataGeneratedAccessors)
- (void)addQuestions:(NSSet*)value_;
- (void)removeQuestions:(NSSet*)value_;
- (void)addQuestionsObject:(Question*)value_;
- (void)removeQuestionsObject:(Question*)value_;

@end

@interface _Quiz (TopicsCoreDataGeneratedAccessors)
- (void)addTopics:(NSSet*)value_;
- (void)removeTopics:(NSSet*)value_;
- (void)addTopicsObject:(Topic*)value_;
- (void)removeTopicsObject:(Topic*)value_;

@end

@interface _Quiz (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveId;
- (void)setPrimitiveId:(NSString*)value;

- (NSMutableSet*)primitiveQuestions;
- (void)setPrimitiveQuestions:(NSMutableSet*)value;

- (NSMutableSet*)primitiveTopics;
- (void)setPrimitiveTopics:(NSMutableSet*)value;

@end
