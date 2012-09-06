//
//  ViewController.h
//  16-ActivityAndProgress-chap11
//
//  Created by exoplatform on 9/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    UIActivityIndicatorView *myActivityView;
}
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *myActivityView;
- (IBAction)doIt:(id)sender;
@end
