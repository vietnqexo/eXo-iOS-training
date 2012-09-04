//
//  TableHandler.h
//  TableProjectOne
//
//  Created by exoplatform on 8/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableHandler : NSObject <UITableViewDelegate, UITableViewDataSource> {
    NSArray *tableDataList;
}
@property (nonatomic, retain) NSArray *tableDataList;
- (void) fillList;
@end
