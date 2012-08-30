//
//  ModalViewExController.h
//  ModalViewExample
//
//  Created by exoplatform on 8/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ModalViewDelegate

- (void) didReceivedMessage: (NSString *) message;

@end

@interface ModalViewExController : UIViewController <ModalViewDelegate> {
    UIButton *showDefaultButton, *showFlipButton, *showDissolveButton, *showCurlButton;
    UIButton *showDelegateButton;
    UILabel *label;
 }
@property (nonatomic, retain) IBOutlet UIButton *showDefaultButton, *showFlipButton, *showDissolveButton, *showCurlButton;
@property (nonatomic, retain) IBOutlet UILabel *label;
@property (nonatomic, retain) IBOutlet UIButton *showDelegateButton;
- (IBAction) showCurl:(id)sender;
- (IBAction) showFlip:(id)sender;
- (IBAction) showDissolve:(id)sender;
- (IBAction) showDefault:(id)sender;
- (IBAction) showDelegate:(id)sender;
@end

