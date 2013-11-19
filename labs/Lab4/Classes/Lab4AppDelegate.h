//
//  Lab4AppDelegate.h
//  Lab4
//
//  Created by Chris Zelenak on 6/21/10.
//  Copyright Fastest Forward 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Lab4ViewController;

@interface Lab4AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UIViewController *viewController;
	UINavigationController *navController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIViewController *viewController;
@property (nonatomic, retain) IBOutlet UINavigationController *navController;

@end

