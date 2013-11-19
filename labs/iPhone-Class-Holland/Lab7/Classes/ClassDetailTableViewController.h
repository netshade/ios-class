//
//  ClassDetailTableViewController.h
//  Lab4
//
//  Created by Chris Zelenak on 6/21/10.
//  Copyright 2010 Fastest Forward. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlippingDuckTableViewCell.h"
#import <CoreData/CoreData.h>

@interface ClassDetailTableViewController : UITableViewController {
	FlippingDuckTableViewCell * headerCell;
	NSManagedObject * student;
}

@property (readwrite, retain) NSManagedObject *student;

@end
