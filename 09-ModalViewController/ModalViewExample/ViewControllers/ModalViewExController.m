//
//  ModalViewExController.m
//  ModalViewExample
//
//  Created by exoplatform on 8/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ModalViewExController.h"
#import "MyViewController.h"

@implementation ModalViewExController

@synthesize showCurlButton, showDissolveButton, showDefaultButton, showFlipButton;

- (IBAction) showCurl:(id)sender {
    MyViewController *myView = [[[MyViewController alloc] init] autorelease];
    [myView setModalTransitionStyle:UIModalTransitionStylePartialCurl];
    [self presentModalViewController:myView animated:YES];
}

- (IBAction) showDefault:(id)sender {
    MyViewController *myView = [[[MyViewController alloc] init] autorelease];
    [self presentModalViewController:myView animated:YES];
}

- (IBAction) showDissolve:(id)sender {
    MyViewController *myView = [[[MyViewController alloc] init] autorelease];
    [myView setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentModalViewController:myView animated:YES];
}

- (IBAction) showFlip:(id)sender {
    MyViewController *myView = [[[MyViewController alloc] init] autorelease];
    [myView setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentModalViewController:myView animated:YES];
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

- (void) dealloc {
    [showDefaultButton release];
    [showFlipButton release];
    [showDissolveButton release];
    [showCurlButton release];
    [super dealloc];
}
@end
