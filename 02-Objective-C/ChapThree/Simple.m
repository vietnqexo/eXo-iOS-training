//
//  Simple.m
//  ChapThree
//
//  Created by exoplatform on 8/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Simple.h"

@implementation Simple 
- (void) sayHello:(NSString *)name {
    NSMutableString *message = [[NSMutableString alloc] initWithString:@"Hello "];
    [message appendString:name];
    NSLog(@"%@",message);
    [message release];
}

+ (void) sayGoodbye {
    NSLog(@"Good bye to you my friend...");
}

- (void) dealloc {
    NSLog(@"deallocating Simple....");
    [super dealloc];
}

- (void) release {
    NSLog(@"releasing Simple....");
    [super release];
}

- (id) retain {
    NSLog(@"retaining Simple...");
    return [super retain];
}

+ (id) alloc {
    NSLog(@"allocating Simple....");
    return [super alloc];
}
@end
