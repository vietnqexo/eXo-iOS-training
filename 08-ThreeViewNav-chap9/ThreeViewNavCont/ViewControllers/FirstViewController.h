//
//  FirstViewController.h
//  ThreeViewNavCont
//
//  Created by exoplatform on 8/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"

@interface FirstViewController : UIViewController {
    SecondViewController *second;
}
@property (nonatomic,retain) SecondViewController *second;
- (IBAction)moveToNextView:(id)sender;
@end
