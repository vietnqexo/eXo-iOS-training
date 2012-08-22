//
//  Simple.m
//  SimpleMultiArg
//
//  Created by exoplatform on 8/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Simple.h"

@implementation Simple
- (void) teamDescription:(NSString *)teamName numofMembers:(int) number leader:(NSString *) leaderName {
    NSLog(@"We are talking about team %@ ",teamName);
    NSLog(@"The team leader is %@",leaderName);
    NSLog(@"Number of members : %d ",number);
}
@end
