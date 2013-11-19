//
//  Lab3AppDelegate.h
//  Lab3
//
//  Created by Chris Zelenak on 6/21/10.
//  Copyright Fastest Forward 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Lab3ViewController;

@interface Lab3AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Lab3ViewController *viewController;
	UINavigationController *navController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Lab3ViewController *viewController;
@property (nonatomic, retain) IBOutlet UINavigationController *navController;

@end

