//
//  GBCommentTesting.m
//  appledoc
//
//  Created by Tomaz Kragelj on 25.7.10.
//  Copyright (C) 2010 Gentle Bytes. All rights reserved.
//

#import "GBApplicationSettingsProvider.h"
#import "GBDataObjects.h"

@interface GBCommentTesting : GHTestCase
@end
	
@implementation GBCommentTesting

#pragma mark Initialization & disposal

- (void)testInit_shouldSetupDefaultComponents {
	// setup & execute
	GBComment *comment = [GBComment commentWithStringValue:@""];
	// verify
	assertThat(comment.longDescription, isNot(nil));
	assertThat(comment.relatedItems, isNot(nil));
	assertThat(comment.methodParameters, isNot(nil));
	assertThat(comment.methodExceptions, isNot(nil));
	assertThat(comment.methodResult, isNot(nil));
}

#pragma mark Comment components testing

- (void)testHtmlString_shouldUseAssignedSettings {
	// setup
	GBCommentComponent *component = [GBCommentComponent componentWithStringValue:@"source"];
	component.markdownValue = @"markdown";
	OCMockObject *settings = [GBTestObjectsRegistry mockSettingsProvider];
	component.settings = settings;
	[[settings expect] stringByConvertingMarkdown:component.markdownValue];
	// execute
	NSString *html = component.htmlValue;
	// verify
	[settings verify];
	html = nil;	// just to suppress compiler warning of unused var...
}

@end
