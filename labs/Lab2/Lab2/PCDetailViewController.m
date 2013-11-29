//
//  PCDetailViewController.m
//  Lab2
//
//  Created by Chris Zelenak on 11/29/13.
//  Copyright (c) 2013 Bootstrapping iOS. All rights reserved.
//

#import "PCDetailViewController.h"

@interface PCDetailViewController ()

@end

@implementation PCDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(IBAction) dismissDetailView:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
