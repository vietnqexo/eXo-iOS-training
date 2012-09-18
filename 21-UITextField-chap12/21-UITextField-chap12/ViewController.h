//
//  ViewController.h
//  21-UITextField-chap12
//
//  Created by exoplatform on 9/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    UITextField *numberField;
}
@property (nonatomic, retain) IBOutlet UITextField *numberField;
- (IBAction)textFieldDone:(id)sender;
- (IBAction)numberFieldDone:(id)sender;
@end
