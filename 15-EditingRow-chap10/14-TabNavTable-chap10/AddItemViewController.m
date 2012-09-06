//
//  AddItemViewController.m
//  14-TabNavTable-chap10
//
//  Created by exoplatform on 9/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AddItemViewController.h"

@implementation AddItemViewController
@synthesize doneButton;
@synthesize parentTable;
@synthesize textField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSLog(@"init add item");
    }
    return self;
}

- (void) dealloc {
    [doneButton release];
    [parentTable release];
    [textField release];
    [super dealloc];
}
- (IBAction)exitAndSave:(id)sender {
    [self.parentTable exitAndSave:self.textField.text];
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
    self.navigationItem.title = @"Add item";
    self.doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(exitAndSave:)];
    self.navigationItem.rightBarButtonItem = self.doneButton;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
