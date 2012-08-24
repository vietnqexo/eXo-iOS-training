//
//  AppDelegate.h
//  TabBarExTwo
//
//  Created by exoplatform on 8/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    UITabBarController *tabBarController;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,retain) UITabBarController *tabBarController;
@end
