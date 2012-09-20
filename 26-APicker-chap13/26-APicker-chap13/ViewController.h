//
//  ViewController.h
//  26-APicker-chap13
//
//  Created by exoplatform on 9/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyPickerDelegate.h"
@class MyPickerDelegate;
@interface ViewController : UIViewController {
    UIPickerView *myPicker;
    MyPickerDelegate *myPickerDelegate;
}
@property (nonatomic, retain) IBOutlet UIPickerView *myPicker;
@property (nonatomic, retain) IBOutlet MyPickerDelegate *myPickerDelegate;
- (IBAction)changeName:(id)sender;
@end
