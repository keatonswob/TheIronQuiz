// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Choice.m instead.

#import "_Choice.h"

const struct ChoiceAttributes ChoiceAttributes = {
	.correct = @"correct",
	.id = @"id",
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

	if ([key isEqualToString:@"correctValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"correct"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic correct;

- (BOOL)correctValue {
	NSNumber *result = [self correct];
	return [result boolValue];
}

- (void)setCorrectValue:(BOOL)value_ {
	[self setCorrect:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveCorrectValue {
	NSNumber *result = [self primitiveCorrect];
	return [result boolValue];
}

- (void)setPrimitiveCorrectValue:(BOOL)value_ {
	[self setPrimitiveCorrect:[NSNumber numberWithBool:value_]];
}

@dynamic id;

@dynamic text;

@dynamic question;

@end

