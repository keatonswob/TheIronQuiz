// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Topic.h instead.

#import <CoreData/CoreData.h>

extern const struct TopicAttributes {
	__unsafe_unretained NSString *text;
	__unsafe_unretained NSString *topic;
} TopicAttributes;

extern const struct TopicRelationships {
	__unsafe_unretained NSString *quiz;
} TopicRelationships;

@class Quiz;

@interface TopicID : NSManagedObjectID {}
@end

@interface _Topic : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) TopicID* objectID;

@property (nonatomic, strong) NSString* text;

//- (BOOL)validateText:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* topic;

//- (BOOL)validateTopic:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Quiz *quiz;

//- (BOOL)validateQuiz:(id*)value_ error:(NSError**)error_;

@end

@interface _Topic (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;

- (NSString*)primitiveTopic;
- (void)setPrimitiveTopic:(NSString*)value;

- (Quiz*)primitiveQuiz;
- (void)setPrimitiveQuiz:(Quiz*)value;

@end
