//
//  main.m
//  SimpleMultiArg
//
//  Created by exoplatform on 8/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Simple.h"
#import "AppDelegate.h"

int main(int argc, char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    Simple *objSimple = [[[Simple alloc] init] autorelease];
    [objSimple teamDescription:@"Mobile" numofMembers:5 leader:@"PHam Tuan"];
    int retVal = UIApplicationMain(argc, argv, nil,nil);
    [pool release];
    return retVal;
    
}
