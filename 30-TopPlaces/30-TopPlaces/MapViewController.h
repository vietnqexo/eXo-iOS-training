//
//  MapViewController.h
//  30-TopPlaces
//
//  Created by exoplatform on 10/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@protocol MapViewControllerDelegate;

@interface MapViewController : UIViewController <MKMapViewDelegate>
@property (nonatomic, retain) NSArray *annotations;
@property (nonatomic, retain) IBOutlet MKMapView *mapView; 
@property (nonatomic, retain) id<MapViewControllerDelegate> delegate;

@end

@protocol MapViewControllerDelegate <NSObject>
-(BOOL) annotationHasThumbnail;
-(void) showPhotoForAnnotation:(id <MKAnnotation>)annotation;
@optional
- (UIImage *)thumbnailForAnnotation:(id <MKAnnotation>)annotation;
@end