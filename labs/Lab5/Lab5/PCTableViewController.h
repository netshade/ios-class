//
//  PCTableViewController.h
//  Lab5
//
//  Created by Chris Zelenak on 12/3/13.
//  Copyright (c) 2013 Bootstrapping iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PCTableViewController : UITableViewController<NSURLConnectionDelegate, NSURLConnectionDataDelegate> {
    NSMutableData * requestData;
    NSURLConnection * connection;
}

@property NSDictionary * items;

-(IBAction) doRefresh:(id)sender;

@end
