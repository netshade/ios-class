//
//  PCTableViewController.h
//  Lab11
//
//  Created by Chris Zelenak on 12/4/13.
//  Copyright (c) 2013 Bootstrapping iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PCTableViewController : UITableViewController<UISearchBarDelegate, UISearchDisplayDelegate>

@property NSArray * persons;
@property NSArray * searchingPersons;
@property BOOL isSearching;

@end
