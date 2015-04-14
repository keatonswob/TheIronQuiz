// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Choice.m instead.

#import "_Choice.h"

const struct ChoiceAttributes ChoiceAttributes = {
	.choice = @"choice",
	.text = @"text",
};

const struct ChoiceRelationships ChoiceRelationships = {
	.question = @"question",
};

@implementation ChoiceID
@end

@implementation _Choice

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Choice" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Choice";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Choice" inManagedObjectContext:moc_];
}

- (ChoiceID*)objectID {
	return (ChoiceID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic choice;

@dynamic text;

@dynamic question;

@end

