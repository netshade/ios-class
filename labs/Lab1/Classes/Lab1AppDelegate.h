//
//  Lab1AppDelegate.h
//  Lab1
//
//  Created by Chris Zelenak on 6/20/10.
//  Copyright Fastest Forward 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Lab1ViewController;

@interface Lab1AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Lab1ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Lab1ViewController *viewController;

@end

