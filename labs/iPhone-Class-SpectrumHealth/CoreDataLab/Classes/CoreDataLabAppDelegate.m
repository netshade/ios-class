//
//  CoreDataLabAppDelegate.m
//  CoreDataLab
//
//  Created by Chris Zelenak on 10/6/10.
//  Copyright 2010 Fastest Forward. All rights reserved.
//

#import "CoreDataLabAppDelegate.h"
#import "CoreDataLabViewController.h"

@implementation CoreDataLabAppDelegate

@synthesize window;
@synthesize viewController;
@synthesize tableController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.

    // Add the view controller's view to the window and display.
	NSArray * a = 
	NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 
										NSUserDomainMask, YES);
	NSString * documentDirectory = 
	[a objectAtIndex:0];
	NSURL * storeURL = [NSURL 
	fileURLWithPath:[documentDirectory 
		 stringByAppendingPathComponent:@"Class.sqlite"]];

	objectModel = [NSManagedObjectModel 				   
			mergedModelFromBundles:nil];
	coordinator = [[NSPersistentStoreCoordinator alloc]
				   initWithManagedObjectModel:objectModel];
	
	NSError * e = nil;
	if(![coordinator 
		addPersistentStoreWithType:NSSQLiteStoreType 
		 configuration:nil 
		 URL:storeURL 
		 options:nil 
		 error:&e]){
		NSLog(@"Core data initialization failed, %@",
			  e);
		abort();
	}
	objectContext = [[NSManagedObjectContext alloc]
					 init];
	[objectContext setPersistentStoreCoordinator:coordinator];
	
	NSUserDefaults * defaults = [NSUserDefaults 
								 standardUserDefaults];
	if(![defaults boolForKey:@"HAS_BEEN_LAUNCHED"]){
		NSBundle * bnd = [NSBundle mainBundle];
		NSString * pth = [bnd pathForResource:@"Class"
									   ofType:@"plist"];
		NSDictionary * d = [[NSDictionary alloc]
							initWithContentsOfFile:pth];
		for(NSString * name in d){
			NSManagedObject * obj
			= [NSEntityDescription 
			   insertNewObjectForEntityForName:@"Students"
			   inManagedObjectContext:objectContext];
			[obj setValue:name forKey:@"name"];
			
			NSString * imgPrefix = 
			@"http://dl.dropbox.com/u/3900704/Class-SH/";
			NSURL * u = [NSURL URLWithString:
			[imgPrefix stringByAppendingString:
			 [d objectForKey:name]]];
			NSData * d = [NSData dataWithContentsOfURL:u];
			
			[obj setValue:d forKey:@"image"];
		}
		[objectContext save:&e];
		if(e){
			NSLog(@"Error occurred, %@", e);
		} else {
			[defaults setBool:YES forKey:@"HAS_BEEN_LAUNCHED"];
			[defaults synchronize];
		}
	}
	// Only if you didn't set up through Interface Bldr
	/*tableController = [[ClassTableViewController alloc]
			initWithNibName:@"ClassTableViewController"
					   bundle:nil];*/
	[tableController setContext:objectContext];
    [window addSubview:tableController.view];
    [window makeKeyAndVisible];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	[tableController release];
	tableController = nil;
	[objectContext release];
	objectContext = nil;
	[coordinator release];
	coordinator = nil;
    [viewController release];
    [window release];
    [super dealloc];
}


@end
