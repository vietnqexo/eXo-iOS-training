//
//  ViewController.h
//  18-ButtonsBackground-chap12
//
//  Created by exoplatform on 9/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    UIButton *clearButton;
    UIButton *smallButton;
}
@property (nonatomic, retain) IBOutlet UIButton *clearButton;
@property (nonatomic, retain) IBOutlet UIButton *smallButton;
- (IBAction)disableBut:(id)sender;
@end
