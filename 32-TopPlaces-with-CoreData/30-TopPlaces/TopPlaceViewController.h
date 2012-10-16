//
//  TopPlaceViewController.h
//  30-TopPlaces
//
//  Created by exoplatform on 10/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapViewController.h"

@interface TopPlaceViewController : UITableViewController <MapViewControllerDelegate> {
    NSArray *topPlaces;   
}
- (IBAction)showPlaceMap:(id)sender;
@property (nonatomic, retain) NSArray *topPlaces;
@property (nonatomic, retain) NSDictionary *countryPlaceDict;
@property (nonatomic, retain) NSArray *countries;

@end
