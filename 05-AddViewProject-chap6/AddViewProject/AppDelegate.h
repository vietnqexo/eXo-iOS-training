//
//  AppDelegate.h
//  AddViewProject
//
//  Created by exoplatform on 8/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    FirstViewController *first;
}
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) FirstViewController *first;
@end
