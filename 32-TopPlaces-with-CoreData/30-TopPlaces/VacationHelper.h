//
//  VacationHelper.h
//  SampleFlickrClient
//
//  Created by exo on 3/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^completion_block_t) (UIManagedDocument *vacation);
#define MY_VACATION @"MyVacation"
#define DEFAULT_DATABASE_FOLDER @"vacations"
@interface VacationHelper : NSObject

+ (NSArray*)getVacations;
+ (UIManagedDocument*)sharedManagedDocumentForVacation:(NSString*)vacationName;
+ (void)openVacation:(NSString*)vacationName usingBlock:(completion_block_t)block;
+ (NSURL*)applicationDocumentsDirectory;

@end
