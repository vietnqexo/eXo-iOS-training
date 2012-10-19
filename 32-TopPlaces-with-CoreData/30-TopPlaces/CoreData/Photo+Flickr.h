//
//  Photo+Flickr.h
//  30-TopPlaces
//
//  Created by exoplatform on 10/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Photo.h"

@interface Photo (Flickr)

+ (Photo *)photoWithFlickrInfo:(NSDictionary *)flickrInfo inManagedObjectContext:(NSManagedObjectContext *)context;
+ (BOOL)photoIsExisted:(NSDictionary*)flickrInfo inManagedObjectContext:(NSManagedObjectContext *)context;

@end
