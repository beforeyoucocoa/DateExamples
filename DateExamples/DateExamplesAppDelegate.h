//
//  DateExamplesAppDelegate.h
//  DateExamples
//
//  Created by Christian Lee on 23/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DateExamplesViewController;

@interface DateExamplesAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet DateExamplesViewController *viewController;

@end
