//
//  Photo+Flickr.m
//  30-TopPlaces
//
//  Created by exoplatform on 10/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Photo+Flickr.h"
#import "FlickrFetcher.h"
#import "Place+Flickr.h"

@implementation Photo (Flickr)
+(BOOL)photoIsExisted:(NSDictionary *)flickrInfo inManagedObjectContext:(NSManagedObjectContext *)context {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Photo"];
    request.predicate = [NSPredicate predicateWithFormat:@"unique = %@",[flickrInfo objectForKey:FLICKR_PHOTO_ID]];
    
    NSError *error;
    NSArray *photos = [context executeFetchRequest:request error:&error];
    if(photos && [photos count] > 0) {
        return YES;
    } else {
        return NO;
    }
    
}
+ (Photo *)photoWithFlickrInfo:(NSDictionary *)flickrInfo inManagedObjectContext:(NSManagedObjectContext *)context {
    Photo *photo = nil;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Photo"];
    request.predicate = [NSPredicate predicateWithFormat:@"unique = %@",[flickrInfo objectForKey:FLICKR_PHOTO_ID]];
    
    NSError *error;
    NSArray *photos = [context executeFetchRequest:request error:&error];
    if(!photos || ([photos count] > 1)) {
        NSLog(@"error fetching photo in photoWithFlickrInfo");
    } else if ([photos count] == 0) {
        photo = [NSEntityDescription insertNewObjectForEntityForName:@"Photo" inManagedObjectContext:context];
        
        photo.unique = [flickrInfo objectForKey:FLICKR_PHOTO_ID];
        photo.title = [flickrInfo objectForKey:FLICKR_PHOTO_TITLE];
        photo.subTitle = [flickrInfo valueForKeyPath:FLICKR_PHOTO_DESCRIPTION];
        photo.place = [Place placeWithName:[flickrInfo objectForKey:FLICKR_PHOTO_PLACE_NAME] inManagedObjectContext:context];
        photo.imageUrl = [[FlickrFetcher urlForPhoto:flickrInfo format:FlickrPhotoFormatLarge] absoluteString];
        
    } else {
        photo = [photos lastObject];
    }
    
    return photo;
    
    
}

@end
