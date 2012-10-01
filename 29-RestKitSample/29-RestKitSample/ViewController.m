//
//  ViewController.m
//  29-RestKitSample
//
//  Created by exoplatform on 10/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "SVProgressHUD.h"
@implementation ViewController 
@synthesize username = _username;
@synthesize password = _password;
@synthesize textView = _textView;
@synthesize idRequest = _idRequest;
@synthesize actRequest = _actRequest;

#pragma mark - static variables
static NSString* BASE_URL = @"http://int.exoplatform.org";
static NSString* ID_RES_PATH = @"rest/private/api/social/v1-alpha3/portal/identity/organization/{user_id}.json";
static NSString* ACTS_RES_PATH = @"rest/private/api/social/v1-alpha3/portal/activity_stream/{soc_id}.json";

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        userAndId = [[NSMutableDictionary alloc] init];
        RKClient *client = [RKClient clientWithBaseURLString:BASE_URL];
        client.cachePolicy = RKRequestCachePolicyNone;
        [RKClient setSharedClient:client];
    }
    return self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)getNewActivities:(id)sender {
    NSString *user = self.username.text;
    NSString *pass = self.password.text;
    RKClient *client = [RKClient sharedClient];
    client.username = user;
    client.password = pass;
    [self.username resignFirstResponder];
    [self.password resignFirstResponder];
    [SVProgressHUD showWithStatus:@"Getting data ..." maskType:SVProgressHUDMaskTypeGradient];
    [self updateLastActivitiesWithUsername:user password:pass];
}

- (void)updateLastActivitiesWithUsername:(NSString *)userName password:(NSString *)passWord {
    NSString* socId = nil;
    if ((socId = [userAndId objectForKey:userName]) == nil) {
        NSString *idResPath = [ID_RES_PATH stringByReplacingOccurrencesOfString:@"{user_id}" withString:userName];
        self.idRequest = [[RKClient sharedClient] requestWithResourcePath:idResPath delegate:self];
        [self.idRequest send];
    } else {
        [self updateLastActivitiesWithIdentity:socId];
    }
}

- (void)updateLastActivitiesWithIdentity:(NSString *)identity {
    NSString *actResPath = [ACTS_RES_PATH stringByReplacingOccurrencesOfString:@"{soc_id}" withString:identity];
    self.actRequest = [[RKClient sharedClient] requestWithResourcePath:actResPath delegate:self];
    [self.actRequest send];
}

- (void)request:(RKRequest *)request didLoadResponse:(RKResponse *)response {
    if (request == self.idRequest && response.statusCode == 200) {
        id jsonParser = [[RKParserRegistry sharedRegistry] parserForMIMEType:RKMIMETypeJSON];
        NSError *error = nil;
        id parsedResponse = [jsonParser objectFromString:[response bodyAsString] error:&error];
        if (error == nil) {
            [userAndId setObject:[parsedResponse objectForKey:@"remoteId"] forKey:[parsedResponse objectForKey:@"id"]];
            [self updateLastActivitiesWithIdentity:[parsedResponse objectForKey:@"id"]];
        } else {
            [SVProgressHUD dismiss];
        }
        return;
    } else if (request == self.actRequest && response.statusCode == 200) {
        id jsonParser = [[RKParserRegistry sharedRegistry] parserForMIMEType:RKMIMETypeJSON];
        NSError *error = nil;
        id parsedResponse = [jsonParser objectFromString:[response bodyAsString] error:&error];
        if (error == nil) {
            NSArray *activities = [parsedResponse objectForKey:@"activities"];
            NSMutableString *actTitles = [[NSMutableString alloc] init];
            for (id activity in activities) {
                NSString *poster = [[activity objectForKey:@"posterIdentity"] objectForKey:@"remoteId"];
                [actTitles appendString:[NSString stringWithFormat:@"- Activity %@ posted by %@ \n", [activity objectForKey:@"title"], poster]];
            }
            self.textView.text = actTitles;
            [actTitles release];
        }
        [SVProgressHUD dismiss];
    }
    
}

- (void)request:(RKRequest *)request didFailLoadWithError:(NSError *)error {
    [SVProgressHUD dismissWithError:[error localizedDescription] afterDelay:2];
}

- (void)dealloc {
    
    [_username release];
    [_password release];
    [userAndId release];
    [_idRequest release];
    [_actRequest release];
    [_textView release];
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
    self.username = nil;
    self.password = nil;
    self.textView = nil;
    self.idRequest = nil;
    self.actRequest = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated {
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
