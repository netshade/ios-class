//
//  FlippingTableViewCell.m
//  Lab4-SH
//
//  Created by Chris Zelenak on 10/5/10.
//  Copyright 2010 Fastest Forward. All rights reserved.
//

#import "FlippingTableViewCell.h"
#import "GradientBackgroundView.h"

@implementation FlippingTableViewCell

@synthesize frontImage;
@synthesize backImage;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
		containerView = [[UIView alloc]
						 initWithFrame:
						 CGRectMake(20.0, 20.0,
									60.0, 60.0)];
		
		frontImage = [[UIImageView alloc]
					  initWithFrame:
					  CGRectMake(0.0, 0.0, 
								 60.0, 60.0)];
		backImage = [[UIImageView alloc]
					 initWithFrame:
					 CGRectMake(0.0, 0.0, 
								60.0, 60.0)];
		[containerView addSubview:backImage];
		[containerView addSubview:frontImage];
		
		GradientBackgroundView * gradient = 
		[[GradientBackgroundView alloc]
		 initWithFrame:CGRectMake(0.0, 0.0, 
								  320.0, 44.0)];
		[[self contentView] addSubview:gradient];
		[[self contentView] addSubview:containerView];
		[gradient release];
    }
    return self;
}

-(void) flip {
	[UIView beginAnimations:nil context:NULL];
	[UIView 
setAnimationTransition:
	 UIViewAnimationTransitionFlipFromRight 
forView:containerView 
	cache:YES];

	UIView * container = containerView;
	int frontIndex = [[container subviews] 
					  indexOfObject:frontImage];
	int backIndex = [[container subviews] 
					 indexOfObject:backImage];
	[container exchangeSubviewAtIndex:frontIndex
				   withSubviewAtIndex:backIndex];
	[UIView commitAnimations];
}

-(void) layoutSubviews {
	[super layoutSubviews];
	[[self contentView] 
	 bringSubviewToFront:containerView];
	UILabel * l = [self textLabel];
	CGFloat width = [containerView frame].size.width;
	CGRect existing = [l frame];
	[l setFrame:CGRectMake(width + 20.0, 
						   existing.origin.y, 
						   existing.size.width, 
						   existing.size.height)];
	
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)dealloc {
	[frontImage release];
	frontImage = nil;
	[backImage release];
	backImage = nil;
    [super dealloc];
}


@end
