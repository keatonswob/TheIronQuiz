// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Choice.h instead.

#import <CoreData/CoreData.h>

extern const struct ChoiceAttributes {
	__unsafe_unretained NSString *correct;
	__unsafe_unretained NSString *id;
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

@property (nonatomic, strong) NSNumber* correct;

@property (atomic) BOOL correctValue;
- (BOOL)correctValue;
- (void)setCorrectValue:(BOOL)value_;

//- (BOOL)validateCorrect:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* id;

//- (BOOL)validateId:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* text;

//- (BOOL)validateText:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Question *question;

//- (BOOL)validateQuestion:(id*)value_ error:(NSError**)error_;

@end

@interface _Choice (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveCorrect;
- (void)setPrimitiveCorrect:(NSNumber*)value;

- (BOOL)primitiveCorrectValue;
- (void)setPrimitiveCorrectValue:(BOOL)value_;

- (NSString*)primitiveId;
- (void)setPrimitiveId:(NSString*)value;

- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;

- (Question*)primitiveQuestion;
- (void)setPrimitiveQuestion:(Question*)value;

@end
