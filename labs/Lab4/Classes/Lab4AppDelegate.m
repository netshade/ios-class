//
//  Lab4AppDelegate.m
//  Lab4
//
//  Created by Chris Zelenak on 6/21/10.
//  Copyright Fastest Forward 2010. All rights reserved.
//

#import "Lab4AppDelegate.h"
#import "Lab4ViewController.h"

@implementation Lab4AppDelegate

@synthesize window;
@synthesize viewController;
@synthesize navController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after app launch    
    [window addSubview:navController.view];
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
	[navController release];
    [viewController release];
    [window release];
    [super dealloc];
}


@end
