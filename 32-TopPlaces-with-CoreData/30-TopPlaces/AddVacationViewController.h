//
//  AddVacationViewController.h
//  30-TopPlaces
//
//  Created by exoplatform on 10/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddVacationDelegate <NSObject>

- (void) didReceivedVacationName;

@end

@interface AddVacationViewController : UIViewController
@property (assign) id<AddVacationDelegate> delegate;
@property (nonatomic, retain) IBOutlet UITextField *vacationNameTF;
- (IBAction)dismissAddViewController:(id)sender;
- (IBAction)backToPreviousView:(id)sender;
@end
