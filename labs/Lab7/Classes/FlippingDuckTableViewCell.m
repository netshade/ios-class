//
//  FlippingDuckTableViewCell.m
//  Lab5
//
//  Created by Chris Zelenak on 6/21/10.
//  Copyright 2010 Fastest Forward. All rights reserved.
//

#import "FlippingDuckTableViewCell.h"


@implementation FlippingDuckTableViewCell

@synthesize containerView;
@synthesize backView;
@synthesize frontView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
		CGRect imgFrame = CGRectMake(0.0, 0.0, 64.0, 64.0);
		containerView = [[UIView alloc] initWithFrame:imgFrame];
		backView = [[UIImageView alloc] initWithFrame:imgFrame];
		[backView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
		frontView = [[UIImageView alloc] initWithFrame:imgFrame];
		[frontView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
		
		[containerView addSubview:backView];
		[containerView addSubview:frontView];
		[[self contentView] addSubview:containerView];
    }
    return self;
}

-(void) layoutSubviews {
	[super layoutSubviews];
	if([frontView image] || [backView image]){
		CGRect contentFrame = [[self contentView] frame];
		CGRect newContainerFrame = CGRectMake(0.0, 0.0, contentFrame.size.height, contentFrame.size.height);
		[containerView setFrame:newContainerFrame];
		CGRect textFrame = [[self textLabel] frame];
		CGFloat offset = newContainerFrame.origin.x + newContainerFrame.size.width;

		[[self textLabel] setFrame:CGRectMake(offset, textFrame.origin.y, contentFrame.size.width - offset, textFrame.size.height)];
	}
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) flipPicture {
	NSInteger backIndex = [[containerView subviews] indexOfObject:backView];
	NSInteger frontIndex = [[containerView subviews] indexOfObject:frontView];
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:1.0];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:containerView cache:YES];
	[containerView exchangeSubviewAtIndex:backIndex withSubviewAtIndex:frontIndex];
	[UIView commitAnimations];
}


- (void)dealloc {
	[containerView release];
	[backView release];
	[frontView release];
    [super dealloc];
}


@end
