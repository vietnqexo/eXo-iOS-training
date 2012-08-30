//
//  MyViewController.h
//  ModalViewExample
//
//  Created by exoplatform on 8/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalViewExController.h"

@interface MyViewController : UIViewController {
    UIButton *dismissButton;
    id<ModalViewDelegate> delegate;
}
@property (nonatomic, retain) IBOutlet UIButton *dismissButton;
@property (nonatomic, retain) IBOutlet id<ModalViewDelegate> delegate;
- (IBAction) dismissView:(id)sender;
@end
