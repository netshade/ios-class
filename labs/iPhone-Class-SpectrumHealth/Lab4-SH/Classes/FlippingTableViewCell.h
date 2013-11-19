//
//  FlippingTableViewCell.h
//  Lab4-SH
//
//  Created by Chris Zelenak on 10/5/10.
//  Copyright 2010 Fastest Forward. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FlippingTableViewCell : UITableViewCell {
	UIImageView * frontImage;
	UIImageView * backImage;
	UIView * containerView;
}

@property(readonly, retain) UIImageView * frontImage;
@property(readonly, retain) UIImageView * backImage;

-(void) flip;

@end
