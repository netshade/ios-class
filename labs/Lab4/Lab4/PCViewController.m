//
//  PCViewController.m
//  Lab4
//
//  Created by Chris Zelenak on 11/30/13.
//  Copyright (c) 2013 Bootstrapping iOS. All rights reserved.
//

#import "PCViewController.h"

@interface PCViewController ()

@end

@implementation PCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.statusLabel.text = [NSString stringWithFormat:@"Currently showing: %@", self.name];
    self.navigationItem.title = self.name;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
