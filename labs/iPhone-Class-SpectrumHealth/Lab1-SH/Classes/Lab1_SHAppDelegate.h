//
//  Lab1_SHAppDelegate.h
//  Lab1-SH
//
//  Created by Chris Zelenak on 10/4/10.
//  Copyright 2010 Fastest Forward. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Lab1_SHViewController;

@interface Lab1_SHAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Lab1_SHViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Lab1_SHViewController *viewController;

@end

