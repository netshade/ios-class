//
//  Lab4_SHAppDelegate.h
//  Lab4-SH
//
//  Created by Chris Zelenak on 10/5/10.
//  Copyright 2010 Fastest Forward. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Lab4_SHViewController;

@interface Lab4_SHAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Lab4_SHViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Lab4_SHViewController *viewController;

@end

