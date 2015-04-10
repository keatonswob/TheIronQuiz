// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Quiz.m instead.

#import "_Quiz.h"

const struct QuizAttributes QuizAttributes = {
	.quiz = @"quiz",
};

const struct QuizRelationships QuizRelationships = {
	.questions = @"questions",
	.topics = @"topics",
};

@implementation QuizID
@end

@implementation _Quiz

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Quiz" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Quiz";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Quiz" inManagedObjectContext:moc_];
}

- (QuizID*)objectID {
	return (QuizID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic quiz;

@dynamic questions;

- (NSMutableSet*)questionsSet {
	[self willAccessValueForKey:@"questions"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"questions"];

	[self didAccessValueForKey:@"questions"];
	return result;
}

@dynamic topics;

- (NSMutableSet*)topicsSet {
	[self willAccessValueForKey:@"topics"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"topics"];

	[self didAccessValueForKey:@"topics"];
	return result;
}

@end

