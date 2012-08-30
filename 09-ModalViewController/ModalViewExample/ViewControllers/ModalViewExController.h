//
//  ModalViewExController.h
//  ModalViewExample
//
//  Created by exoplatform on 8/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModalViewExController : UIViewController {
    UIButton *showDefaultButton, *showFlipButton, *showDissolveButton, *showCurlButton;
 }
@property (nonatomic, retain) IBOutlet UIButton *showDefaultButton, *showFlipButton, *showDissolveButton, *showCurlButton;
- (IBAction) showCurl:(id)sender;
- (IBAction) showFlip:(id)sender;
- (IBAction) showDissolve:(id)sender;
- (IBAction) showDefault:(id)sender;
@end
