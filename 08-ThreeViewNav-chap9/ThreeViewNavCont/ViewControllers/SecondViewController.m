//
//  SecondViewController.m
//  ThreeViewNavCont
//
//  Created by exoplatform on 8/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"


@implementation SecondViewController
@synthesize navBut;
@synthesize nextButton;
@synthesize third;

- (void) dealloc {
    [third release];
    [navBut release];
    [super dealloc];
}
- (IBAction) moveToNextView:(id)sender {
    self.third = [[[ThirdViewController alloc] initWithNibName:@"ThirdViewController" bundle:nil] autorelease];
    [self.navigationController pushViewController:self.third animated:YES];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"SecondView", @"SecondView");
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
    self.navBut = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(moveToNextView:)];
    self.navigationItem.rightBarButtonItem = self.navBut;
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

@end
