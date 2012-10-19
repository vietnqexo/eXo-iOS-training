//
//  VacationsViewController.m
//  30-TopPlaces
//
//  Created by exoplatform on 10/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VacationsViewController.h"
#import "VacationHelper.h"
#import "AddVacationViewController.h"
#import "PlacesCDTableViewController.h"

@implementation VacationsViewController
@synthesize vacations = _vacations;
@synthesize delegate = _delegate;

- (void)addVacationTapped:(id)sender {
    AddVacationViewController *addVacationViewController = [[AddVacationViewController alloc] init];
    addVacationViewController.delegate = self;
    [addVacationViewController setModalTransitionStyle:UIModalTransitionStylePartialCurl];
    [self presentModalViewController:addVacationViewController animated:YES];
}

- (void)dealloc {
    [_vacations release];
    [_delegate release];
    [super dealloc];
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        self.title = @"Vacations";
        self.tabBarItem.image = [UIImage imageNamed:@"airplane"];
    }
    return  self;
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
    
    self.vacations = [VacationHelper getVacations];
    UIBarButtonItem *navBut = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addVacationTapped:)];
    self.navigationItem.rightBarButtonItem = navBut;
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.vacations count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    
    NSString *vacation = [self.vacations objectAtIndex:indexPath.row];
    cell.textLabel.text = vacation;
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PlacesCDTableViewController *placesView = [[[PlacesCDTableViewController alloc] initWithNibName:@"PlacesCDTableViewController" bundle:nil] autorelease];
    NSLog(@"init places view for vacation");
    placesView.vacationName = [self.vacations objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:placesView animated:YES];
    
}

- (void)didReceivedVacationName {
    self.vacations = [VacationHelper getVacations];
    [self.tableView reloadData];
    NSLog(@"%@", [VacationHelper getVacations]);
}

@end
