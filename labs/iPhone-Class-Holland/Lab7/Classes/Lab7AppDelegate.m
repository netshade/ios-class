//
//  Lab7AppDelegate.m
//  Lab7
//
//  Created by Chris Zelenak on 6/21/10.
//  Copyright Fastest Forward 2010. All rights reserved.
//

#import "Lab7AppDelegate.h"
#import "Lab7ViewController.h"


@implementation Lab7AppDelegate

@synthesize window;
@synthesize viewController;
@synthesize navController;

@synthesize persistentStoreCoordinator;
@synthesize managedObjectContext;
@synthesize managedObjectModel;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	NSString * documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSURL *storeUrl = [NSURL fileURLWithPath:[documentsDirectory stringByAppendingPathComponent: @"Class.sqlite"]];
	NSError *error = nil;
	
	managedObjectModel = [[NSManagedObjectModel mergedModelFromBundles:nil] retain];  
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];
    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:&error]){
		NSLog(@"Couldn't create persistent store, %@", error);
		abort();
	}
	managedObjectContext = [[NSManagedObjectContext alloc] init];
	[managedObjectContext setPersistentStoreCoordinator:persistentStoreCoordinator];
	
	NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
	if(![defaults boolForKey:@"importedStudents"]){
		NSBundle * bnd = [NSBundle mainBundle];
		NSArray * students = [[NSArray alloc] initWithContentsOfFile:[bnd pathForResource:@"students" ofType:@"plist"]];
		NSData * frontImage = [NSData dataWithContentsOfFile:[bnd pathForResource:@"duck" ofType:@"png"]];
		NSData * backImage = [NSData dataWithContentsOfFile:[bnd pathForResource:@"angry_duck" ofType:@"png"]];
		for(NSString * name in students){
			NSManagedObject * obj = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:managedObjectContext];
			[obj setValue:name forKey:@"name"];
			[obj setValue:frontImage forKey:@"image"];
			[obj setValue:backImage forKey:@"alternateImage"];
		}
		error = nil;
		[managedObjectContext save:&error];
		if(error){
			NSLog(@"Couldn't save import, %@", error);
		} else {
			[defaults setBool:YES forKey:@"importedStudents"];
			[defaults synchronize];
		}
	}
		
 
    // Override point for customization after app launch    
    [window addSubview:navController.view];
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
	[managedObjectModel release];
	[persistentStoreCoordinator release];
	[managedObjectContext release];
	[navController release];
    [viewController release];
    [window release];
    [super dealloc];
}


@end
