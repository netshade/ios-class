//
//  FlippingDuckTableViewCell.h
//  Lab5
//
//  Created by Chris Zelenak on 6/21/10.
//  Copyright 2010 Fastest Forward. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FlippingDuckTableViewCell : UITableViewCell {
	UIView * containerView;
	UIImageView * backView;
	UIImageView * frontView;
}

@property(readonly, retain) UIView * containerView;
@property(readonly, retain) UIImageView * backView;
@property(readonly, retain) UIImageView * frontView;

-(void) flipPicture;

@end
