//
//  Lab1AppDelegate.m
//  Lab1
//
//  Created by Chris Zelenak on 6/20/10.
//  Copyright Fastest Forward 2010. All rights reserved.
//

#import "Lab1AppDelegate.h"
#import "Lab1ViewController.h"

@implementation Lab1AppDelegate
@synthesize window;
@synthesize viewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
