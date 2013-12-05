//
//  PCViewController.m
//  Lab11
//
//  Created by Chris Zelenak on 12/4/13.
//  Copyright (c) 2013 Bootstrapping iOS. All rights reserved.
//

#import "PCViewController.h"
#import "PCAppDelegate.h"

@interface PCViewController ()

@end

@implementation PCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if(self.subject){
        self.nameField.text = self.subject.name;
        self.salarySlider.value = self.subject.salary.floatValue;
        self.birthdatePicker.date = self.subject.birthDate;
        self.vegetarianSwitch.on = self.subject.vegetarian.boolValue;
    }
}

-(IBAction)updateSalary:(id)sender
{
    self.salaryDisplay.text = [NSString stringWithFormat:@"$%.2f", self.salarySlider.value];
}

-(IBAction)deleteSubject:(id)sender
{
    if(self.subject){
        PCAppDelegate * d = (PCAppDelegate *)[[UIApplication sharedApplication] delegate];
        NSManagedObjectContext * mainContext = [d mainContext];
        [mainContext deleteObject:self.subject];
        [self.navigationController popViewControllerAnimated:YES];
    }
}


-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

-(IBAction)saveSubject:(id)sender
{
    Person * p = self.subject;
    PCAppDelegate * d = (PCAppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext * mainContext = [d mainContext];
    if(!p){
        p = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:mainContext];
    }
    [p setName:self.nameField.text];
    [p setBirthDate:self.birthdatePicker.date];
    [p setSalary:@(self.salarySlider.value)];
    [p setVegetarian:@(self.vegetarianSwitch.isOn)];
    
    NSError * error;
    [mainContext save:&error];
    if(error != nil){
        [[[UIAlertView alloc] initWithTitle:@"Couldn't save"
                                    message:[error description]
                                   delegate:nil
                          cancelButtonTitle:@"Dismiss"
                           otherButtonTitles:nil] show];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
