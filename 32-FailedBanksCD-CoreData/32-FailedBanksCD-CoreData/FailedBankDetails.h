//
//  FailedBankDetails.h
//  32-FailedBanksCD-CoreData
//
//  Created by exoplatform on 10/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class FailedBankInfo;

@interface FailedBankDetails : NSManagedObject

@property (nonatomic, retain) NSDate * closeDate;
@property (nonatomic, retain) NSDate * updatedDate;
@property (nonatomic, retain) NSNumber * zip;
@property (nonatomic, retain) FailedBankInfo *info;

@end
