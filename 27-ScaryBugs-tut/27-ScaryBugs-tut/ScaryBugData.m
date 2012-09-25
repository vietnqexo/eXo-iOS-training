//
//  ScaryBugData.m
//  27-ScaryBugs-tut
//
//  Created by exoplatform on 9/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ScaryBugData.h"

@implementation ScaryBugData
@synthesize title = _title;
@synthesize rating = _rating;
-(id) initWithTitle:(NSString *)title rating:(float)rating {
    if(self = [self init]) {
        self.title = title;
        self.rating = rating;
    }
    return self;
}
@end
