//
//  PlaceAnnotation.m
//  30-TopPlaces
//
//  Created by exoplatform on 10/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PlaceAnnotation.h"
#import "Utils.h"
@implementation PlaceAnnotation 
@synthesize place = _place;

+ (PlaceAnnotation *)annotationForPlace:(NSDictionary *)place {
    PlaceAnnotation *annotation = [[PlaceAnnotation alloc] init];
    annotation.place = place;
    return annotation;
}

- (NSString *)title {
    return [Utils titleForPlace:self.place];
}

- (NSString *)subtitle {
    return [Utils descriptionForPlace:self.place];
}

- (CLLocationCoordinate2D)coordinate {
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = [[self.place objectForKey:FLICKR_LATITUDE] doubleValue];
    coordinate.longitude = [[self.place objectForKey:FLICKR_LONGITUDE] doubleValue];
    return coordinate;
}
@end
