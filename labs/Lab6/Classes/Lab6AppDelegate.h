//
//  Lab6AppDelegate.h
//  Lab6
//
//  Created by Chris Zelenak on 6/21/10.
//  Copyright Fastest Forward 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class Lab6ViewController;

@interface Lab6AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UIViewController *viewController;
	UINavigationController *navController;
	NSPersistentStoreCoordinator * persistentStoreCoordinator;
	NSManagedObjectContext * managedObjectContext;
	NSManagedObjectModel * managedObjectModel;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIViewController *viewController;
@property (nonatomic, retain) IBOutlet UINavigationController *navController;
@property (nonatomic, readonly, retain) NSPersistentStoreCoordinator * persistentStoreCoordinator;
@property (nonatomic, readonly, retain) NSManagedObjectContext * managedObjectContext;
@property (nonatomic, readonly, retain) NSManagedObjectModel * managedObjectModel;

@end

