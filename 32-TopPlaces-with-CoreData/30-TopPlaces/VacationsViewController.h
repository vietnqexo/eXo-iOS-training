//
//  VacationsViewController.h
//  30-TopPlaces
//
//  Created by exoplatform on 10/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddVacationViewController.h"
#import "PhotoDetailController.h"

@interface VacationsViewController : UITableViewController <AddVacationDelegate>
@property (nonatomic, retain) NSArray *vacations;
@property (nonatomic, retain) PhotoDetailController *delegate;
- (IBAction)addVacationTapped:(id)sender;
@end
