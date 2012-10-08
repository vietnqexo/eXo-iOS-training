//
//  Utils.h
//  30-TopPlaces
//
//  Created by exoplatform on 10/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlickrFetcher.h"

#define MAX_RECENT 20
#define RECENT_PHOTOS @"recent_phots"

@interface Utils : NSObject

+ (void) pushPhotoToList:(NSDictionary *)photo;
+ (void) initPrefs;
+ (NSArray *) getRecentPhotos;
+ (NSString *) subtitleForPhoto: (NSDictionary *)photo;
+ (NSString *) titleForPhoto: (NSDictionary *)photo; 
+ (NSString *) titleForPlace: (NSDictionary *)place;
+ (NSString *) descriptionForPlace: (NSDictionary *)place;
+ (NSDictionary *)selectTopPlaces:(NSArray *)topPlaces;
@end
