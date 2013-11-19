//
//  SecondViewController.m
//  Lab2-SH
//
//  Created by Chris Zelenak on 10/4/10.
//  Copyright 2010 Fastest Forward. All rights reserved.
//

#import "SecondViewController.h"
#import "ClassTableViewController.h"

@implementation SecondViewController

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	NSDate * d = [NSDate date];
	[[self navigationItem]
	 setTitle:[d description]];
[[self navigationItem] 
 setRightBarButtonItem:[[[UIBarButtonItem alloc]
 initWithTitle:@"Home"
 style:UIBarButtonItemStyleBordered 
 target:self 
 action:@selector(goHome:)] autorelease]];
	
	
}

-(void) goHome:(id) sender {
	[[self navigationController] 
	 popToRootViewControllerAnimated:YES];
	
}


-(IBAction) spawnNewController:(id)sender {
	UIButton * b = (UIButton *) sender;
	BOOL animate = NO;
	if([b tag] == 1){
		animate = YES;
	} 
	ClassTableViewController * tbv = 
	[[ClassTableViewController alloc]
	 initWithNibName:@"ClassTableViewController"
	 bundle:nil];
	[[self navigationController]
	 pushViewController:tbv 
	 animated:animate];
	[tbv release];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
