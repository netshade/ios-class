//
//  PCTableViewController.h
//  Lab9
//
//  Created by Chris Zelenak on 12/4/13.
//  Copyright (c) 2013 Bootstrapping iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PCTableViewController : UITableViewController<NSURLConnectionDataDelegate> {
    NSMutableData * buffer;
}

@property NSDictionary * items;

@end
