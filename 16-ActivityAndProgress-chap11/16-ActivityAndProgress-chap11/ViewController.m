//
//  ViewController.m
//  16-ActivityAndProgress-chap11
//
//  Created by exoplatform on 9/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
@implementation ViewController
@synthesize myActivityView;

int completed = 0;

- (void) moveBar:(id)object {
    completed ++;
    myActivityView.myProgress.progress = completed/20.0f;
    if(completed > 20) {
        [object invalidate];
        [self.myActivityView.view removeFromSuperview];
        [self.view setAlpha:1.0f];
        completed = 0;
        self.myActivityView.myProgress.progress = 0;
    }
    
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (IBAction)doIt:(id)sender {
    myActivityView.view.backgroundColor = [UIColor clearColor];
    [self.view setAlpha:0.7f];
    [((AppDelegate *) [UIApplication sharedApplication].delegate).window insertSubview:myActivityView.view aboveSubview:self.view];
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(moveBar:) userInfo:nil repeats:YES];
}

- (void) dealloc {
    [myActivityView release];
    [super dealloc];
}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
