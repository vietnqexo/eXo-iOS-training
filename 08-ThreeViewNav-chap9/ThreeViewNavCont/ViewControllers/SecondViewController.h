//
//  SecondViewController.h
//  ThreeViewNavCont
//
//  Created by exoplatform on 8/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThirdViewController.h"

@interface SecondViewController : UIViewController {
    UIBarButtonItem *navBut;
    UIButton *nextButton;
    ThirdViewController *third;
}
@property (nonatomic,retain) ThirdViewController *third;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *navBut;
@property (nonatomic,retain) IBOutlet UIButton *nextButton;
- (IBAction)moveToNextView:(id)sender;
@end
