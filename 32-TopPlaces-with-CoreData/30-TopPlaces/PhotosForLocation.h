//
//  PhotosForLocation.h
//  30-TopPlaces
//
//  Created by exoplatform on 10/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapViewController.h"

@interface PhotosForLocation : UITableViewController <MapViewControllerDelegate>
@property (nonatomic, retain) NSArray *photos;
@property (nonatomic, retain) NSDictionary *location;

- (IBAction)showPhotosMap:(id)sender;
@end
