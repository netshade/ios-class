//
//  Lab2_SHAppDelegate.h
//  Lab2-SH
//
//  Created by Chris Zelenak on 10/4/10.
//  Copyright 2010 Fastest Forward. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Lab2_SHViewController;

@interface Lab2_SHAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Lab2_SHViewController *viewController;
	UINavigationController * navController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Lab2_SHViewController *viewController;

@end

