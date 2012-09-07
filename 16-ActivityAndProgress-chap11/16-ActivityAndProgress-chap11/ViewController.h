//
//  ViewController.h
//  16-ActivityAndProgress-chap11
//
//  Created by exoplatform on 9/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PleaseWaitViewController.h"
@interface ViewController : UIViewController {
    PleaseWaitViewController *myActivityView;
    
}
@property (nonatomic, retain) IBOutlet PleaseWaitViewController *myActivityView;
- (IBAction)doIt:(id)sender;
- (void) moveBar: (id) object;
@end
