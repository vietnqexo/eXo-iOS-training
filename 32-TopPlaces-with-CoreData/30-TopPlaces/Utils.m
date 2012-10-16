//
//  Utils.m
//  30-TopPlaces
//
//  Created by exoplatform on 10/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+ (void) initPrefs {
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    if([prefs objectForKey:RECENT_PHOTOS] == nil) {
        [prefs registerDefaults:[NSDictionary dictionaryWithObject:[NSArray array] forKey:RECENT_PHOTOS]];
        
    }
}

+ (NSArray *) getRecentPhotos {
    return [[NSUserDefaults standardUserDefaults] objectForKey:RECENT_PHOTOS];
}

+ (void) pushPhotoToList:(NSDictionary *)photo {
    NSString *photoId = [photo objectForKey:@"id"];
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSArray *photos = [prefs objectForKey:RECENT_PHOTOS];
    NSMutableArray *newArray = [NSMutableArray arrayWithCapacity:MAX_RECENT];
    [newArray addObject:photo];
    for(int i = 0; i < MIN(MAX_RECENT - 1,[photos count]); i++) {
        NSDictionary *aPhoto = [photos objectAtIndex:i];
        NSString *aPhotoId = [aPhoto objectForKey:@"id"];
        if (![photoId isEqualToString:aPhotoId]) {
            [newArray addObject:aPhoto];
        }
    }
    [prefs setObject:newArray forKey:RECENT_PHOTOS];
    [prefs synchronize];
    
}

+(NSString *)subtitleForPhoto:(NSDictionary *)photo {
    NSString *subtitle = [photo objectForKey:FLICKR_PHOTO_DESCRIPTION];
    if(![subtitle length]) {
        subtitle = @"";
    }
    return subtitle;
}

+ (NSString *)titleForPhoto:(NSDictionary *)photo {
    NSString *title = [photo objectForKey:FLICKR_PHOTO_TITLE];
    if(![title length]) {
        title = [Utils subtitleForPhoto:photo];
        if(![title length]) {
            title = @"Unknown";
        }
    }
    return title;
}

+ (NSString *)countryForPlace:(NSDictionary *)place
{
	NSString *placeInfo = [place objectForKey:FLICKR_PLACE_NAME];
	NSRange lastComma = [placeInfo rangeOfString:@"," options:NSBackwardsSearch];
    
    return (lastComma.location == NSNotFound) ? @"" : [placeInfo substringFromIndex:lastComma.location+2];
}

+ (NSString *)descriptionFromPlace:(NSString *)place
{
    NSString *description = place;
    
    NSRange firstComma = [description rangeOfString:@","];
	if (firstComma.location != NSNotFound) 
        description = [description substringFromIndex:firstComma.location + 1];
    
    return description;
}

+ (NSString *)descriptionForPlace:(NSDictionary *)place
{
    return [self descriptionFromPlace:[place objectForKey:FLICKR_PLACE_NAME]];
}

+ (NSString *)titleFromPlace:(NSString *)place
{
    NSString *title = place;
    
    NSRange firstComma = [title rangeOfString:@","];
	if (firstComma.location != NSNotFound) 
        title = [title substringToIndex:firstComma.location];
    
    return title;
}

+ (NSString *)titleForPlace:(NSDictionary *)place
{
    return [self titleFromPlace:[place objectForKey:FLICKR_PLACE_NAME]];
}

+ (NSArray *)titlesForPlace:(NSDictionary *)place
{
    NSArray* titles;
    
    NSString *description = [place objectForKey:FLICKR_PLACE_NAME];
    NSRange firstComma = [description rangeOfString:@","];
    if (firstComma.location != NSNotFound) 
        titles = [description componentsSeparatedByString:@","];  
    else 
        titles = [NSArray arrayWithObjects:description, @"", nil];
    
    return titles;
}

+ (NSDictionary *)selectTopPlaces:(NSArray *)topPlaces
{
	NSMutableDictionary *placesByCountry = [NSMutableDictionary dictionary];
    
	for (NSDictionary *place in topPlaces) {
		NSString *country = [self countryForPlace:place];	
		if (![placesByCountry objectForKey:country]) 
			[placesByCountry setObject:[NSMutableArray array] forKey:country];
		[(NSMutableArray *)[placesByCountry objectForKey:country] addObject:place];		
	}
    
	return placesByCountry;
}
@end
