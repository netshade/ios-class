//
//  Lab4_SHViewController.m
//  Lab4-SH
//
//  Created by Chris Zelenak on 10/5/10.
//  Copyright 2010 Fastest Forward. All rights reserved.
//

#import "Lab4_SHViewController.h"
#import "FlippingTableViewCell.h"

#import <dispatch/dispatch.h>
@implementation Lab4_SHViewController



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/
-(NSInteger) tableView:(UITableView *)table 
 numberOfRowsInSection:(NSInteger)section {
	return [classMembers count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView 
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	FlippingTableViewCell * cell =
	[tableView dequeueReusableCellWithIdentifier:@"Cell"];
	if(!cell){
		cell = [[[FlippingTableViewCell alloc]
				 initWithStyle:UITableViewCellStyleDefault 
				 reuseIdentifier:@"Cell"] autorelease];
	}
	NSInteger row = [indexPath row];
	NSArray * keys = [classMembers allKeys];
	NSString * key = [keys objectAtIndex:row];
	
	[[cell textLabel] setText:key];
	NSString * urlPrefix = 
	@"http://dl.dropbox.com/u/3900704/Class-SH/";
	/*
	dispatch_async(dispatch_get_main_queue(), ^{
		NSString * url = [urlPrefix 
						  stringByAppendingString:[classMembers objectForKey:key]];
		NSURL * imgUrl = [NSURL URLWithString:url];
		NSData * d = [NSData dataWithContentsOfURL:imgUrl];
		UIImage * img = [UIImage imageWithData:d];
		[[cell frontImage] 
		 setImage:img];
	});*/
	
	[[cell frontImage] 
	 setImage:[UIImage imageNamed:@"duck.png"]];
	[[cell backImage]
	 setImage:[UIImage imageNamed:@"duck.png"]];
	return cell;
		
}

-(void) tableView:(UITableView *)tableView 
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	FlippingTableViewCell * cell = 
	(FlippingTableViewCell *)[tableView 
				cellForRowAtIndexPath:indexPath];
	[cell flip];
}

-(CGFloat) tableView:(UITableView *)tb 
heightForRowAtIndexPath:(NSIndexPath *)path {
	return  100.0;
}




// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	/*
	NSBundle * bnd = [NSBundle mainBundle];
	NSString * path = [bnd
					   pathForResource:@"Class"
					   ofType:@"plist"];
	NSDictionary * d = [[NSDictionary alloc]
						initWithContentsOfFile:path];
	 */
	NSDictionary * d = [[NSDictionary alloc]
						initWithContentsOfURL:
[NSURL URLWithString:
@"http://dl.dropbox.com/u/3900704/Class-SH/Class.plist"]];
	
						
	classMembers = d;
}
- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	[classMembers release];
	classMembers = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
