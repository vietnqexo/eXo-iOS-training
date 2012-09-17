//
//  ViewController.h
//  20-SwitchSlider-chap12
//
//  Created by exoplatform on 9/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    UISwitch *mySwitch;
}
@property (nonatomic,retain) IBOutlet UISwitch *mySwitch;
- (IBAction)handleSwitch:(id)sender;
- (IBAction)handleSlider:(id)sender;

@end
