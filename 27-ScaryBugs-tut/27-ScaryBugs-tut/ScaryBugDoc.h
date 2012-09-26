//
//  ScaryBugDoc.h
//  27-ScaryBugs-tut
//
//  Created by exoplatform on 9/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
@class ScaryBugData;
#import <Foundation/Foundation.h>

@interface ScaryBugDoc : NSObject 
@property (strong) ScaryBugData *data;
@property (strong) UIImage *thumbImage;
@property (strong) UIImage *fullImage;
-(id) initWithTitle:(NSString *)title rating:(float)rating thumbImage:(UIImage *)thumbImage fullImage:(UIImage *)fullImage; 
@end
