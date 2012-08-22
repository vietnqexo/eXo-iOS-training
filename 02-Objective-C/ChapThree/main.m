//
//  main.m
//  ChapThree
//
//  Created by exoplatform on 8/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#import "Simple.h"
int main(int argc, char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    Simple *mySimple = [[Simple alloc] init];
    NSLog(@"retain count: %d", [mySimple retainCount]);
    [mySimple sayHello:@"Quoc Viet"];
    [mySimple release];
    [Simple sayGoodbye];
    int retVal = UIApplicationMain(argc,argv,nil,nil);
    [pool release];
    return retVal;
    
}
