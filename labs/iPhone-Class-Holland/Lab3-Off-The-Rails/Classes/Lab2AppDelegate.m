//
//  Lab2AppDelegate.m
//  Lab2
//
//  Created by Chris Zelenak on 6/22/10.
//  Copyright Fastest Forward 2010. All rights reserved.
//

#import "Lab2AppDelegate.h"
#import "Lab2ViewController.h"

@implementation Lab2AppDelegate

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
