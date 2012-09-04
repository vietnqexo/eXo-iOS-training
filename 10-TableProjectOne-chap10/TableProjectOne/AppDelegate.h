//
//  AppDelegate.h
//  TableProjectOne
//
//  Created by exoplatform on 8/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    MyViewController *viewController;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) IBOutlet MyViewController *viewController;
@end
