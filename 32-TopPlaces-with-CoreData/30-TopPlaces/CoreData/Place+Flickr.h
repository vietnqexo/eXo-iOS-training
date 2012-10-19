//
//  Place+Flickr.h
//  30-TopPlaces
//
//  Created by exoplatform on 10/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Place.h"

@interface Place (Flickr)
+ (Place*)placeWithName:(NSString *)name inManagedObjectContext:(NSManagedObjectContext*)context;
@end
