//
//  PCViewController.h
//  Lab10
//
//  Created by Chris Zelenak on 12/4/13.
//  Copyright (c) 2013 Bootstrapping iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PCViewController : UIViewController

@property NSString * path;

@property IBOutlet UITextField * titleField;
@property IBOutlet UITextView * bodyView;

-(IBAction) doSave:(id)sender;

@end
