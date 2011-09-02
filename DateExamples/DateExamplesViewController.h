//
//  DateExamplesViewController.h
//  DateExamples
//
//  Created by Christian Lee on 23/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DateExamplesViewController : UIViewController {
	UILabel *outputLabel;
}

@property (nonatomic, retain) UILabel *outputLabel;

// Shows how to compare two dates
- (void) compareDates;

@end
