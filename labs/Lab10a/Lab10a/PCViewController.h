//
//  PCViewController.h
//  Lab10a
//
//  Created by Chris Zelenak on 12/5/13.
//  Copyright (c) 2013 Bootstrapping iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface BasicAnnotation : NSObject<MKAnnotation>

@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * subtitle;
@property (nonatomic, copy) NSURL * imageUrl;
@property int annotationIndex;
@end

@interface PCViewController : UIViewController<MKMapViewDelegate,
NSURLConnectionDataDelegate>

@property IBOutlet MKMapView * mapView;
@property NSMutableData * buffer;
@property NSArray * coordinates;
@property BasicAnnotation * selectedAnnotation;

@end
