//
//  ViewController.h
//  QuickStart
//
//  Created by exoplatform on 8/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    IBOutlet UILabel *greetingLabel;
}
@property (nonatomic, retain) IBOutlet UILabel *greetingLabel;
- (IBAction)sayHello:(id)sender;

@end
