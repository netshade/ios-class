//
//  AsyncImageView.m
//  CoreDataLab
//
//  Created by Chris Zelenak on 10/6/10.
//  Copyright 2010 Fastest Forward. All rights reserved.
//

#import "AsyncImageView.h"


@implementation AsyncImageView


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
    }
    return self;
}

-(void) downloadImageFromURL:(NSURL *)url {
	if(connection){
		[connection cancel];
		[connection release];
		[dataBuffer release];
	}
	NSURLRequest * req = [[NSURLRequest alloc]
						  initWithURL:url];
	connection = [[NSURLConnection alloc]
				  initWithRequest:req 
				  delegate:self];
	dataBuffer = [[NSMutableData alloc] init];
}

-(void) connection:(NSURLConnection *)connection 
	didReceiveData:(NSData *)data {
	[dataBuffer appendData:data];
}

-(void) connectionDidFinishLoading:
(NSURLConnection *)conn {
	UIImage * img = [UIImage 
					 imageWithData:dataBuffer];
	[self setImage:img];
	[dataBuffer release];
	dataBuffer = nil;
	[connection release];
	connection = nil;
}

-(void) connection:(NSURLConnection *)conn 
  didFailWithError:(NSError *)error {
	[dataBuffer release];
	dataBuffer = nil;
	[connection release];
	connection = nil;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)dealloc {
    [super dealloc];
}


@end
