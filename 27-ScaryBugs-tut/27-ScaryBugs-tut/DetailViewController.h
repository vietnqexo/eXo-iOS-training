//
//  DetailViewController.h
//  27-ScaryBugs-tut
//
//  Created by exoplatform on 9/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RateView.h"
@class ScaryBugDoc;
@interface DetailViewController : UIViewController

@property (strong, nonatomic) ScaryBugDoc *detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (strong, nonatomic) IBOutlet UITextField *titleField;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet RateView *rateView;
@property (strong, nonatomic) UIImagePickerController * picker;
- (IBAction)addPictureTapped:(id)sender;
- (IBAction)titleFieldTextChanged:(id)sender;

@end
