//
//  AsyncImageView.h
//  CoreDataLab
//
//  Created by Chris Zelenak on 10/6/10.
//  Copyright 2010 Fastest Forward. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AsyncImageView : UIImageView {
	NSMutableData * dataBuffer;
	NSURLConnection * connection;
}

-(void) downloadImageFromURL:(NSURL *)url;


@end
