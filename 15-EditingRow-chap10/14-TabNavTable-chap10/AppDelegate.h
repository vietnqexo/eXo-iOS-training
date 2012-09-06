//
//  AppDelegate.h
//  14-TabNavTable-chap10
//
//  Created by exoplatform on 8/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    UITabBarController *myCont;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *myCont;
@end
