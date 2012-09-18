//
//  ViewController.m
//  23-MyWeb-chap12
//
//  Created by exoplatform on 9/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "MyWebViewDelegate.h"
@implementation ViewController
@synthesize myWebView, myTextField, myWebViewDelegate;


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
    myWebViewDelegate = [[MyWebViewDelegate alloc] init];
    myWebView.delegate = myWebViewDelegate;
}

- (void)dealloc {
    myWebView.delegate = nil;
    [myWebViewDelegate release];
    [myWebView release];
    [myTextField release];
    [super dealloc];
}

- (IBAction)changeLocation:(id)sender {
    [myTextField resignFirstResponder];
    NSURL *url = [NSURL URLWithString:myTextField.text];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [myWebView loadRequest:request];
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
