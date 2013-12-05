//
//  PCViewController.m
//  Lab10a
//
//  Created by Chris Zelenak on 12/5/13.
//  Copyright (c) 2013 Bootstrapping iOS. All rights reserved.
//

#import "PCViewController.h"
#import "PCImageViewController.h"



@implementation BasicAnnotation
@end

@interface PCViewController ()

@end

@implementation PCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSURL * url = [NSURL URLWithString:@"http://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1"];
    NSURLRequest * req = [NSURLRequest requestWithURL:url];
    NSError * err;
    NSHTTPURLResponse * resp;
    NSData * json = [NSURLConnection sendSynchronousRequest:req returningResponse:&resp error:&err];
    NSLog(@"Response is %@, error is %@", resp, err);
    NSDictionary * result = [NSJSONSerialization JSONObjectWithData:json options:0 error:&err];
    NSLog(@"Second error: %@", err);
//    NSString * coordinates = https://gist.github.com/netshade/7805961/raw/7a64689e4132263b626fcce346cab8743370d0cd/coordinates.json
    NSArray * items = result[@"items"];
    NSLog(@"Items are %@", items);
    self.coordinates = @[
          @[@(39.76086989), @(-86.09757829)],
          @[@(39.7863158), @(-86.18213742)],
          @[@(39.79117821), @(-86.14879769)],
          @[@(39.81917532), @(-86.10297819)],
          @[@(39.79636724), @(-86.08487503)],
          @[@(39.77425791), @(-86.14833736)],
          @[@(39.72851886),  @(-86.1906329)],
          @[@(39.80005767), @(-86.0743134)],
          @[@(39.76392219), @(-86.11534466)],
          @[@(39.82623548), @(-86.15251547)],
          @[@(39.83791526), @(-86.13348246)],
          @[@(39.82064555), @(-86.2141191)],
          @[@(39.70076726), @(-86.1461581)],
          @[@(39.80540848), @(-86.20123005)],
          @[@(39.73107027), @(-86.11612924)],
          @[@(39.78225855), @(-86.14921908)],
          @[@(39.70828314), @(-86.10928677)],
          @[@(39.75617585), @(-86.09290296)],
          @[@(39.77501891), @(-86.18809282)],
          @[@(39.79841914), @(-86.21011834)]
          ];
    for(int i = 0; i < [items count]; i++){
        NSArray * points = self.coordinates[i];
        NSDictionary * info = items[i];
        BasicAnnotation * annotation = [[BasicAnnotation alloc] init];
        //
        annotation.coordinate = CLLocationCoordinate2DMake(
                                [(NSNumber *)points[0] doubleValue],
                                    [(NSNumber *)points[1] doubleValue]);
        annotation.title = info[@"title"];
        annotation.subtitle = info[@"author"];
        annotation.imageUrl =
            [NSURL URLWithString:((NSDictionary *)info[@"media"])[@"m"]];
        annotation.annotationIndex = i;
        [self.mapView addAnnotation:annotation];
        NSLog(@"Added annotation %@", info[@"title"]);
    }
}

-(MKAnnotationView * ) mapView:(MKMapView *)mapView
             viewForAnnotation:(id<MKAnnotation>)annotation
{
    UIButton * btn = [UIButton
                      buttonWithType:UIButtonTypeDetailDisclosure];
    [btn addTarget:self
            action:@selector(selectorPressed:)
  forControlEvents:UIControlEventTouchUpInside];
    
    btn.tag = ((BasicAnnotation *) annotation).annotationIndex;
    
    MKPinAnnotationView * pin = [[MKPinAnnotationView alloc]
                                 initWithAnnotation:annotation
                                 reuseIdentifier:nil];
    pin.canShowCallout = YES;
    pin.rightCalloutAccessoryView = btn;
    return pin;
}

-(IBAction) selectorPressed:(id)sender
{
    UIButton * btn = (UIButton *) sender;
    BasicAnnotation * annotation = (BasicAnnotation *) self.mapView.annotations[btn.tag];
    self.selectedAnnotation = annotation;
    [self performSegueWithIdentifier:@"ShowImage" sender:self];
}

-(void) mapView:(MKMapView *)mapView
        didSelectAnnotationView:(MKAnnotationView *)view
{
    self.selectedAnnotation = [view annotation];
    [self performSegueWithIdentifier:@"ShowImage" sender:self];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    PCImageViewController * imageController = (PCImageViewController *) [segue destinationViewController];
    [imageController setImage:[[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:self.selectedAnnotation.imageUrl]]];
}

-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{

}

-(void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
