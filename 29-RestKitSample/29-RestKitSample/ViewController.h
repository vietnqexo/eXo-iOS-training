//
//  ViewController.h
//  29-RestKitSample
//
//  Created by exoplatform on 10/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>
@interface ViewController : UIViewController <UITextFieldDelegate, RKRequestDelegate> {
    NSMutableDictionary *userAndId;
}
@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (nonatomic, retain) RKRequest *idRequest;
@property (nonatomic, retain) RKRequest *actRequest;


- (IBAction)getNewActivities:(id)sender;
- (void)updateLastActivitiesWithUsername:(NSString*)username password:(NSString*)password;
- (void)updateLastActivitiesWithIdentity:(NSString*)identity;


@end
