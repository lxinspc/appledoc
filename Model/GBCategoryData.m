//
//  GBCategoryData.m
//  appledoc
//
//  Created by Tomaz Kragelj on 27.7.10.
//  Copyright (C) 2010, Gentle Bytes. All rights reserved.
//

#import "GBCategoryData.h"

@implementation GBCategoryData

#pragma mark Initialization & disposal

+ (id)categoryDataWithName:(NSString *)name className:(NSString *)className {
	return [[[self alloc] initWithName:name className:className] autorelease];
}

- (id)initWithName:(NSString *)name className:(NSString *)className {
	NSParameterAssert(className && [className length] > 0);
	self = [super init];
	if (self) {
		_categoryName = name ? [name copy] : nil;
		_className = [className copy];
		_adoptedProtocols = [[GBAdoptedProtocolsProvider alloc] init];
		_methods = [[GBMethodsProvider alloc] init];
	}
	return self;
}

#pragma mark Overriden methods

- (NSString *)description {
	if (self.isExtension) return [NSString stringWithFormat:@"%@()", self.className];
	return [NSString stringWithFormat:@"%@(%@)", self.className, self.categoryName];
}

#pragma mark Properties

- (BOOL)isExtension {
	return ([self categoryName] == nil);
}

@synthesize categoryName = _categoryName;
@synthesize className = _className;
@synthesize adoptedProtocols = _adoptedProtocols;
@synthesize methods = _methods;

@end
