//
//  ClassTableViewController.h
//  CoreDataLab
//
//  Created by Chris Zelenak on 10/6/10.
//  Copyright 2010 Fastest Forward. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface ClassTableViewController : UITableViewController {
	NSManagedObjectContext * context;
	NSArray * objects;
}

@property(readwrite, retain) 
NSManagedObjectContext * context;

@end
