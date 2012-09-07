//
//  PleaseWaitViewController.h
//  16-ActivityAndProgress-chap11
//
//  Created by exoplatform on 9/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PleaseWaitViewController : UIViewController {
    UIProgressView *myProgress;
}
@property (nonatomic, retain) IBOutlet UIProgressView *myProgress;
@end
