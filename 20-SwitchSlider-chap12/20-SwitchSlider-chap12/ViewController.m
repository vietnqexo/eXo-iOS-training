//
//  ViewController.m
//  20-SwitchSlider-chap12
//
//  Created by exoplatform on 9/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize mySwitch;

- (IBAction)handleSwitch:(id)sender {
    if([((UISwitch *)sender) isOn] == YES){
        NSLog(@"Its on");
    } else {
        NSLog(@"It's off");
    }
}
- (IBAction)handleSlider:(id)sender {
    NSLog(@"Vale: %f", ((UISlider *)sender).value);
    [mySwitch setOn: (((UISlider *)sender).value == ((UISlider *)sender).maximumValue)];
}

- (void) dealloc {
    [mySwitch release];
    [super dealloc];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
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
