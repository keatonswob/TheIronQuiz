// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Question.m instead.

#import "_Question.h"

const struct QuestionAttributes QuestionAttributes = {
	.id = @"id",
	.text = @"text",
};

const struct QuestionRelationships QuestionRelationships = {
	.choices = @"choices",
	.quiz = @"quiz",
};

@implementation QuestionID
@end

@implementation _Question

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Question";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Question" inManagedObjectContext:moc_];
}

- (QuestionID*)objectID {
	return (QuestionID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic id;

@dynamic text;

@dynamic choices;

- (NSMutableSet*)choicesSet {
	[self willAccessValueForKey:@"choices"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"choices"];

	[self didAccessValueForKey:@"choices"];
	return result;
}

@dynamic quiz;

@end

