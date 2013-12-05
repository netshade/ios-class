//
//  PCViewController.h
//  Lab10
//
//  Created by Chris Zelenak on 12/4/13.
//  Copyright (c) 2013 Bootstrapping iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PCViewController : UIViewController<UITextViewDelegate>

@property NSString * path;

@property IBOutlet UITextField * titleField;
@property IBOutlet UITextView * bodyView;
@property IBOutlet UIScrollView * scrollView;
@property IBOutlet NSLayoutConstraint * heightConstraint;

-(IBAction) doSave:(id)sender;

@end
