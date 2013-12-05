//
//  PCViewController.m
//  Lab10
//
//  Created by Chris Zelenak on 12/4/13.
//  Copyright (c) 2013 Bootstrapping iOS. All rights reserved.
//

#import "PCViewController.h"

@interface PCViewController ()

@end

@implementation PCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Goddammit apple
    
    if(self.path){
        NSString * title = [[self.path componentsSeparatedByString:@"/"] lastObject];
        NSString * body = [NSString stringWithContentsOfFile:self.path encoding:NSUTF8StringEncoding error:nil];
        self.titleField.text = title;
        self.bodyView.text = body;
    }
	// Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)doSave:(id)sender {
    NSString * title = self.titleField.text;
    if([title length] > 0){
        NSString * body = self.bodyView.text;
        NSString * docsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
        NSString * path =[docsDirectory stringByAppendingPathComponent:title];
        [body writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
        [[self navigationController] popViewControllerAnimated:YES];
    }
}



-(void) textViewDidEndEditing:(UITextView *)textView
{
}

-(void) textViewDidBeginEditing:(UITextView *)textView
{
    self.heightConstraint.constant -= 104;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
