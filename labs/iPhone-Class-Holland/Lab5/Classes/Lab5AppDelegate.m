//
//  Lab5AppDelegate.m
//  Lab5
//
//  Created by Chris Zelenak on 6/21/10.
//  Copyright Fastest Forward 2010. All rights reserved.
//

#import "Lab5AppDelegate.h"
#import "Lab5ViewController.h"

@implementation Lab5AppDelegate

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
