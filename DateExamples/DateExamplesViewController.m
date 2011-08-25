//
//  DateExamplesViewController.m
//  DateExamples
//
//  Created by Christian Lee on 23/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DateExamplesViewController.h"

@implementation DateExamplesViewController

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
	[super viewDidLoad];
	
	// Create test date one - 5 days before today
	NSTimeInterval daysAgo = 5 * 24 * 60 * 60;
	NSDate *testDateOne = [[NSDate alloc] initWithTimeIntervalSinceNow:-daysAgo];
	
	// Create test date two - 3 days before today
	daysAgo = 3 * 24 * 60 * 60;
	NSDate *testDateTwo = [[NSDate alloc] initWithTimeIntervalSinceNow:-daysAgo];
	
	// Compare test date one to test date two
	if ([testDateOne compare:testDateTwo] == NSOrderedDescending)
	{
		NSLog(@"Test Date Two is before Test Date One.");
	}
	else if ([testDateOne compare:testDateTwo] == NSOrderedAscending)
	{
		NSLog(@"Test Date Two is after Test Date One.");
	}
	else if ([testDateOne compare:testDateTwo] == NSOrderedSame)
	{
		NSLog(@"Test Date Two is the same as Test Date One.");
	}
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
	// Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void) deleteFilesFromDownloadDirectory:(NSString *)directoryPath whichAreOlderThanInDays:(int)days
{
	NSDirectoryEnumerator* directoryEnumerator = [[NSFileManager defaultManager] enumeratorAtPath:directoryPath];
	
	NSString* file;
	
	NSTimeInterval daysAgo = days * 24 * 60 * 60;
	NSDate *expiryDate = [[NSDate alloc] initWithTimeIntervalSinceNow:-daysAgo];
	
	while ((file = [directoryEnumerator nextObject])) 
	{
		// Get creation date
		NSString *currentFilePath = [directoryPath stringByAppendingPathComponent:file];
		NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:currentFilePath error:nil];
		NSDate *fileCreationDate = [attributes objectForKey:NSFileCreationDate];
		
		// If creation date is before the expiry date, delete the item
		if ([expiryDate compare:fileCreationDate] > 0)
		{
			[[NSFileManager defaultManager] removeItemAtPath:currentFilePath error:nil];
		}
	}
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
