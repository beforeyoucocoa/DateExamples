//
//  DateExamplesViewController.m
//  DateExamples
//
//  Created by Christian Lee on 23/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DateExamplesViewController.h"

@implementation DateExamplesViewController
@synthesize outputLabel;

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
	
	// Set background
	self.view.backgroundColor = [UIColor whiteColor];
	
	// Create test label
	UILabel *tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 30, 260, 260)];
	self.outputLabel = tempLabel;
	[tempLabel release];
	self.outputLabel.numberOfLines = 0;
	self.outputLabel.lineBreakMode = UILineBreakModeWordWrap;
	self.outputLabel.font = [self.outputLabel.font fontWithSize:10.0];
	[self.view addSubview:tempLabel];
	
	// Run a test
	[self compareDates];
}

// Shows how to compare two dates
- (void) compareDates
{
	// Create test date one - Christmas, 25th of December 1970, 1:15pm
	NSDateComponents *comps = [[NSDateComponents alloc] init];
	[comps setYear:1970];
	[comps setMonth:12];
	[comps setDay:25];
	[comps setHour:13];
	[comps setMinute:15];
	[comps setSecond:0];
	NSDate *christmasDay = [[NSCalendar currentCalendar] dateFromComponents:comps];
	[comps release];
	
	// Create testDateTwo - 20th of December 1970, 3:30pm
	comps = [[NSDateComponents alloc] init];
	[comps setYear:1970];
	[comps setMonth:12];
	[comps setDay:20];
	[comps setHour:15];
	[comps setMinute:30];
	[comps setSecond:0];
	NSDate *testDateTwo = [[NSCalendar currentCalendar] dateFromComponents:comps];
	[comps release];

	// Compare testDateTwo with Christmas day, 1970
	NSComparisonResult result = [christmasDay compare:testDateTwo];
	switch (result) {
		case NSOrderedDescending:
			outputLabel.text = @"testDateTwo is before Christmas Day 1970, 1:15pm";
			break;
		case NSOrderedAscending:
			outputLabel.text = @"testDateTwo is after Christmas Day 1970, 1:15pm";
			break;
		case NSOrderedSame:
			outputLabel.text = @"testDateTwo is on Christmas Day 1970, 1:15pm";
			break;
		default:
			break;
	}
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
	// Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	self.outputLabel = nil;
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
