//
//  PCViewController.m
//  Lab1
//
//  Created by Chris Zelenak on 11/25/13.
//  Copyright (c) 2013 Bootstrapping iOS. All rights reserved.
//

#import "PCViewController.h"

@interface PCViewController ()

@end

@implementation PCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(IBAction) helloWorldTapped:(id)sender {
    [[[UIAlertView alloc] initWithTitle:@"Hello World"
                                message:@"Yay it worked"
                               delegate:nil
                      cancelButtonTitle:@"Dismiss"
                      otherButtonTitles: nil] show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
