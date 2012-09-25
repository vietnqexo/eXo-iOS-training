//
//  ScaryBugDoc.m
//  27-ScaryBugs-tut
//
//  Created by exoplatform on 9/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ScaryBugDoc.h"
#import "ScaryBugData.h"
@implementation ScaryBugDoc
@synthesize data = _data;
@synthesize thumImage = _thumImage;
@synthesize fullImage = _fullImage;
-(id) initWithTitle:(NSString *)title rating:(float)rating thumbImage:(UIImage *)thumImage fullImage:(UIImage *)fullImage {
    if(self = [self init]) {
        self.data = [[ScaryBugData alloc] initWithTitle:title rating:rating];
        self.thumImage = thumImage;
        self.fullImage = fullImage;
    }
    return self;
}
@end
