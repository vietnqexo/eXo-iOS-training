//
//  ViewController.m
//  28-PromoTest-webservice
//
//  Created by exoplatform on 9/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "SBJson.h"
#import "MBProgressHUD.h"

@implementation ViewController
@synthesize textView;
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"Want to redeem: %@", textField.text);
    UIDevice *device = [UIDevice currentDevice];
    NSString *identifier = [device uniqueIdentifier];
    
    NSString *code = textField.text;
    NSURL *url = [NSURL URLWithString:@"http://www.wildfables.com/promos/"];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setPostValue:identifier forKey:@"device_id"];
    [request setPostValue:code forKey:@"code"];
    [request setPostValue:@"1" forKey:@"rw_app_id"];
    [request startAsynchronous];
    [request setDelegate:self];

    [textField resignFirstResponder];
    textView.text = @"";
    
    return TRUE;
}


- (void)requestFinished:(ASIHTTPRequest *)request
{    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    if (request.responseStatusCode == 400) {
        textView.text = @"Invalid code";        
    } else if (request.responseStatusCode == 403) {
        textView.text = @"Code already used";
    } else if (request.responseStatusCode == 200) {
        NSString *responseString = [request responseString];
        NSDictionary *responseDict = [responseString JSONValue];
        NSString *unlockCode = [responseDict objectForKey:@"unlock_code"];
        
        if ([unlockCode compare:@"com.razeware.test.unlock.cake"] == NSOrderedSame) {
            textView.text = @"The cake is a lie!";
        } else {        
            textView.text = [NSString stringWithFormat:@"Received unexpected unlock code: %@", unlockCode];
        }
        
    } else {
        textView.text = @"Unexpected error";
    }
    
}

- (void)requestFailed:(ASIHTTPRequest *)request
{    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    NSError *error = [request error];
    textView.text = error.localizedDescription;
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
    [self setTextView:nil];
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

- (void)dealloc {
    [textView release];
    [super dealloc];
}
@end
