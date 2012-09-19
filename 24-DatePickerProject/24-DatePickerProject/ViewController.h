//
//  ViewController.h
//  24-DatePickerProject
//
//  Created by exoplatform on 9/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    UIDatePicker *datePicker;
    UILabel *label;
}
@property (nonatomic, retain) IBOutlet UIDatePicker *datePicker;
@property (nonatomic, retain) IBOutlet UILabel *label;
- (IBAction) changeValue:(id)sender;
@end
