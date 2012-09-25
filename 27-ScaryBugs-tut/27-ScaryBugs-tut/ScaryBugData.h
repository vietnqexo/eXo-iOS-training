//
//  ScaryBugData.h
//  27-ScaryBugs-tut
//
//  Created by exoplatform on 9/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScaryBugData : NSObject 
@property (strong) NSString *title;
@property (assign) float rating;
- (id) initWithTitle: (NSString *) title rating:(float)rating;

@end
