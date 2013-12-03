//
//  PCTableViewController.h
//  Lab6
//
//  Created by Chris Zelenak on 12/3/13.
//  Copyright (c) 2013 Bootstrapping iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PCTableViewController : UITableViewController<NSURLConnectionDelegate, NSURLConnectionDataDelegate> {
    NSMutableData * requestData;
    NSURLConnection * connection;
    NSTimer * timer;
}

@property NSDictionary * items;

@end
