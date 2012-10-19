//
//  PhotosCDTableViewController.h
//  30-TopPlaces
//
//  Created by exoplatform on 10/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CoreDataTableViewController.h"
#import "Place.h"
@interface PhotosCDTableViewController : CoreDataTableViewController
@property (nonatomic, retain) Place *place;
@end
