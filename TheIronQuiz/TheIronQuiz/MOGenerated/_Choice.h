// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Choice.h instead.

#import <CoreData/CoreData.h>

extern const struct ChoiceAttributes {
	__unsafe_unretained NSString *choice;
	__unsafe_unretained NSString *text;
} ChoiceAttributes;

extern const struct ChoiceRelationships {
	__unsafe_unretained NSString *question;
} ChoiceRelationships;

@class Question;

@interface ChoiceID : NSManagedObjectID {}
@end

@interface _Choice : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ChoiceID* objectID;

@property (nonatomic, strong) NSString* choice;

//- (BOOL)validateChoice:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* text;

//- (BOOL)validateText:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Question *question;

//- (BOOL)validateQuestion:(id*)value_ error:(NSError**)error_;

@end

@interface _Choice (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveChoice;
- (void)setPrimitiveChoice:(NSString*)value;

- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;

- (Question*)primitiveQuestion;
- (void)setPrimitiveQuestion:(Question*)value;

@end
