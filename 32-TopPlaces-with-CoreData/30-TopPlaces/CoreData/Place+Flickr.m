//
//  Place+Flickr.m
//  30-TopPlaces
//
//  Created by exoplatform on 10/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Place+Flickr.h"
#import "FlickrFetcher.h"
#import "CoreData/CoreData.h"
@implementation Place (Flickr)
+ (Place *)placeWithName:(NSString *)name inManagedObjectContext:(NSManagedObjectContext *)context {
    Place *place = nil;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Place"];
    request.predicate = [NSPredicate predicateWithFormat:@"name = %@",name];
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
    NSError *error;
    NSArray *places= [context executeFetchRequest:request error:&error];
    if(!places || ([places count] > 1)) {
        NSLog(@"error fetching place");
    } else if ([places count] == 0) {
        place = [NSEntityDescription insertNewObjectForEntityForName:@"Place" inManagedObjectContext:context];
        place.name = name;
        place.visitedDate = [NSDate date];
    } else {
        place = [places lastObject];
    }
    return place;
    
}
@end
