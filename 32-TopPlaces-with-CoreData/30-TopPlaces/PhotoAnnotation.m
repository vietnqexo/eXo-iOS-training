//
//  PhotoAnnotation.m
//  30-TopPlaces
//
//  Created by exoplatform on 10/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PhotoAnnotation.h"
#import "Utils.h"
@implementation PhotoAnnotation 
@synthesize photo = _photo;
+(PhotoAnnotation *)anotationForPhoto:(NSDictionary *)photo {
    PhotoAnnotation *annotation = [[PhotoAnnotation alloc] init];
    annotation.photo = photo;
    return annotation;
    
}

- (NSString *)title {
    return [Utils titleForPhoto:self.photo];
}

- (NSString *)subtitle {
    return [Utils subtitleForPhoto:self.photo];
}

-(CLLocationCoordinate2D)coordinate {
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = [[self.photo objectForKey:FLICKR_LATITUDE] doubleValue];
    coordinate.longitude = [[self.photo objectForKey:FLICKR_LONGITUDE] doubleValue];
    return coordinate;
}
@end
