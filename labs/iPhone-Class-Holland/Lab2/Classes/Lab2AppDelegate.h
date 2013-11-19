//
//  Lab2AppDelegate.h
//  Lab2
//
//  Created by Chris Zelenak on 6/21/10.
//  Copyright Fastest Forward 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Lab2ViewController;

@interface Lab2AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Lab2ViewController *viewController;
	UINavigationController *navController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Lab2ViewController *viewController;
@property (nonatomic, retain) IBOutlet UINavigationController *navController;

@end

