//
//  Lab3AppDelegate.m
//  Lab3
//
//  Created by Chris Zelenak on 6/21/10.
//  Copyright Fastest Forward 2010. All rights reserved.
//

#import "Lab3AppDelegate.h"
#import "Lab3ViewController.h"

@implementation Lab3AppDelegate

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
