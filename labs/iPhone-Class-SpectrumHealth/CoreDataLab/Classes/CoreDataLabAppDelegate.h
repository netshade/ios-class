//
//  CoreDataLabAppDelegate.h
//  CoreDataLab
//
//  Created by Chris Zelenak on 10/6/10.
//  Copyright 2010 Fastest Forward. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "ClassTableViewController.h"

@class CoreDataLabViewController;

@interface CoreDataLabAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CoreDataLabViewController *viewController;
	NSPersistentStoreCoordinator * coordinator;
	NSManagedObjectModel * objectModel;
	NSManagedObjectContext * objectContext;
	ClassTableViewController * tableController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CoreDataLabViewController *viewController;
@property (nonatomic, retain) IBOutlet 
 ClassTableViewController * tableController;

@end

