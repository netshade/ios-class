//
//  PCViewController.h
//  Lab11
//
//  Created by Chris Zelenak on 12/4/13.
//  Copyright (c) 2013 Bootstrapping iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface PCViewController : UIViewController<UITextFieldDelegate>

@property Person * subject;
@property IBOutlet UILabel * salaryDisplay;
@property IBOutlet UISlider * salarySlider;
@property IBOutlet UITextField * nameField;
@property IBOutlet UIDatePicker * birthdatePicker;
@property IBOutlet UISwitch * vegetarianSwitch;

-(IBAction)updateSalary:(id)sender;
-(IBAction)deleteSubject:(id)sender;
-(IBAction)saveSubject:(id)sender;

@end
