//
//  ViewController.h
//  25-ATimer-chap13
//
//  Created by exoplatform on 9/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    UIDatePicker *timePicker;
}
@property (nonatomic, retain) IBOutlet UIDatePicker *timePicker;
- (IBAction)echoTime:(id)sender;
- (void)echoIt: (NSTimer *)timer;

@end
