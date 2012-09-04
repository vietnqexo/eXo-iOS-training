//
//  AppDelegate.h
//  11-TableProjectTwo-chap10
//
//  Created by exoplatform on 8/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTableViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    MyTableViewController *viewController;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) MyTableViewController *viewController;
@end
