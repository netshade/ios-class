//
//  PCAppDelegate.h
//  Lab11
//
//  Created by Chris Zelenak on 12/4/13.
//  Copyright (c) 2013 Bootstrapping iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface PCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property NSManagedObjectModel * objectModel;
@property NSManagedObjectContext * mainContext;
@property NSPersistentStoreCoordinator * coordinator;

@end
