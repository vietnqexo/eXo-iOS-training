//
//  FBCDMasterViewController.h
//  32-FailedBanksCD-CoreData
//
//  Created by exoplatform on 10/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FBCDMasterViewController : UITableViewController
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic,strong) NSArray* failedBankInfos;

@end
