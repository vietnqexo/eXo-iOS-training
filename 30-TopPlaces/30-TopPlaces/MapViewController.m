//
//  MapViewController.m
//  30-TopPlaces
//
//  Created by exoplatform on 10/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MapViewController.h"
#define MAP_PIN_VIEW @"map_pin_view" 
#define MAP_REGION_MARGIN .02

@implementation MapViewController
@synthesize mapView = _mapView;
@synthesize delegate = _delegate;
@synthesize annotations = _annotations;

- (void) dealloc {
    [_mapView release];
    [_delegate release];
    [_annotations release];
    [super dealloc];
}

-(void) updateMapWithAnnotations:(NSArray*) annotations
{
    // skip if mapView not ready yet
    if (!self.mapView || !annotations || !annotations.count) return;
    
    // attach annotations
    [self.mapView removeAnnotations:self.mapView.annotations];
    [self.mapView addAnnotations:annotations];
    
    // zoom/pan map to a proper size
    CLLocationDegrees minLat = 90, maxLat = -90, minLng = 180, maxLng = -180;
    for (id <MKAnnotation> annotation in annotations) {
        CLLocationCoordinate2D coord = [annotation coordinate];
        if (coord.latitude < minLat) minLat = coord.latitude;
        if (coord.latitude > maxLat) maxLat = coord.latitude;
        if (coord.longitude < minLng) minLng = coord.longitude;
        if (coord.longitude > maxLng) maxLng = coord.longitude;
    }
    
    // set region's center, span
    MKCoordinateRegion region;
    region.center.latitude = (maxLat + minLat)/2.0;
    region.center.longitude = (maxLng + minLng)/2.0;
    region.span.latitudeDelta = (maxLat - minLat + MAP_REGION_MARGIN);
    region.span.longitudeDelta = (maxLng - minLng + MAP_REGION_MARGIN);
    
    [self.mapView setRegion:region animated:NO];
}

-(void) setAnnotations:(NSArray *)annotations
{
    if (_annotations != annotations) {
        _annotations = annotations;
        
        // this do nothing if view (from prepareForSegue) not yet loaded 
        [self updateMapWithAnnotations:annotations];
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.mapView.delegate = self;
    self.mapView.mapType = MKMapTypeStandard;
    [self updateMapWithAnnotations:self.annotations];
    

    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#pragma mark - MKMapViewDelegate methods

-(MKAnnotationView*) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKAnnotationView* view = [mapView dequeueReusableAnnotationViewWithIdentifier:MAP_PIN_VIEW];
    if (!view) {
        view = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                               reuseIdentifier:MAP_PIN_VIEW];
        view.canShowCallout = YES;
        view.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    }
    
    view.leftCalloutAccessoryView =  (![self.delegate annotationHasThumbnail]) 
    ? nil 
    : [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    view.annotation = annotation;
    
    return view;
}


- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view
{
    [(UIImageView *)view.leftCalloutAccessoryView setImage:nil];
}

-(void) mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view 
calloutAccessoryControlTapped:(UIControl *)control
{
    if ([control isKindOfClass:[UIButton class]]) 
        [self.delegate showPhotoForAnnotation:view.annotation];  
}

@end
