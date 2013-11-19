//
//  GradientBackgroundView.m
//  Lab4-SH
//
//  Created by Chris Zelenak on 10/5/10.
//  Copyright 2010 Fastest Forward. All rights reserved.
//

#import "GradientBackgroundView.h"


@implementation GradientBackgroundView


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
		[self setUserInteractionEnabled:YES];
		UITapGestureRecognizer tap = 
		[[UITapGestureRecognizer alloc]
		 initWithTarget:self 
		 action:@selector(respondToTap:)];
		[tap setNumberOfTapsRequired:2];
		[self addGestureRecognizer:tap];
    }
    return self;
}

-(void) respondToTap:(UIGestureRecognizer *)tapEvent {
	
}

-(void) touchesBegan:(NSSet *)touches 
		   withEvent:(UIEvent *)event {
	UITouch * t = [touches anyObject];
	CGPoint p = [t locationInView:self];
	// PSUEDOcode
	UIView * someSubView;
	CGRect fr = [someSubView frame];
	if(CGRectContainsPoint(fr, p)){
		
	}
	// other option
	UIView * found = [self hitTest:pt 
						 withEvent:event];
	if(found){
		
	}
}

-(void) touchesEnded:(NSSet *)touches 
		   withEvent:(UIEvent *)event {
}

-(void) touchesMoved:(NSSet *)touches 
		   withEvent:(UIEvent *)event {
}

- (void)drawRect:(CGRect)rect {
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGFloat locations[4] = {
		0.0, 0.25, 0.83712, 1.0
	}; 
	CGFloat components[16] = {
		1.0, 0.0, 0.0, 1.0,
		0.0, 1.0, 0.0, 1.0,
		0.0, 0.0, 1.0, 1.0,
		0.3, 0.3, 0.3, 1.0
	};
	CGColorSpaceRef cs = CGColorSpaceCreateDeviceRGB();
	CGGradientRef gradient = 
	CGGradientCreateWithColorComponents(
	cs, 
	components, 
	locations, 
	4);
	CGContextDrawLinearGradient(context,
								gradient, 
								CGPointZero,
			CGPointMake(0.0, rect.size.height), 
				NULL);
	CGGradientRelease(gradient);
	CGColorSpaceRelease(cs);
}


- (void)dealloc {
    [super dealloc];
}


@end
