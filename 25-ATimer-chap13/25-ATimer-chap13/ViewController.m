//
//  ViewController.m
//  25-ATimer-chap13
//
//  Created by exoplatform on 9/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize timePicker;
NSInteger seconds = 0;
- (void) dealloc {
    [timePicker release];
    [super dealloc];
}

- (IBAction)echoTime:(id)sender {
    NSDate *time = timePicker.date;
    NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc]init] autorelease];
    [dateFormatter setDateFormat:@"HH:MM:SS"];
    NSLog(@"date: %@", [dateFormatter stringFromDate:time]);
    NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [gregorian components:(NSHourCalendarUnit|NSMinuteCalendarUnit) fromDate:time];
    NSInteger hour = [comps hour];
    NSInteger minute = [comps minute];
    NSLog(@"Hour: %i", hour);
    NSLog(@"Minute: %i",minute);
    NSInteger secs = hour * 60 * 60 + minute * 60;
    NSNumber *elapsedSeconds = [[NSNumber alloc]initWithInt:secs];
    NSDictionary *myDict =[NSDictionary dictionaryWithObject:elapsedSeconds forKey:@"TotalSeconds"];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(echoIt:) userInfo:myDict repeats:YES];
}

- (void) echoIt:(NSTimer *)timer {
    NSNumber *num = (NSNumber *)[[timer userInfo] valueForKey:@"TotalSeconds"];
    seconds++;
    NSInteger secs = [num integerValue] - seconds;
    NSLog(@"elapsed: %i, remaining: %i", seconds, secs);
    
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
