//
//  PlaceAnnotation.h
//  30-TopPlaces
//
//  Created by exoplatform on 10/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface PlaceAnnotation : NSObject <MKAnnotation>
@property (nonatomic, retain) NSDictionary *place;

+ (PlaceAnnotation *) annotationForPlace:(NSDictionary *) place;

@end
