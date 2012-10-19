//
//  AddVacationViewController.m
//  30-TopPlaces
//
//  Created by exoplatform on 10/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AddVacationViewController.h"
#import "VacationHelper.h"
@implementation AddVacationViewController
@synthesize delegate = _delegate;
@synthesize vacationNameTF = _vacationNameTF;
- (void)dealloc {
    [_delegate release];
    [_vacationNameTF release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dismissAddViewController:(id)sender {
   [VacationHelper openVacation:self.vacationNameTF.text usingBlock:^(UIManagedDocument *vacation) {
       [self.delegate didReceivedVacationName];
       [self dismissModalViewControllerAnimated:YES];
   }];
}

-(void)backToPreviousView:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}
@end
