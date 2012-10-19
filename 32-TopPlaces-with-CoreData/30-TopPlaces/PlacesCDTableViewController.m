//
//  PlacesCDTableViewController.m
//  30-TopPlaces
//
//  Created by exoplatform on 10/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PlacesCDTableViewController.h"
#import "PhotosCDTableViewController.h"
#import "VacationHelper.h"

@implementation PlacesCDTableViewController
@synthesize vacationName = _vacationName;
@synthesize places = _places;

- (void)dealloc {
    [_vacationName release];
    [_places release];
    [super dealloc];
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

- (void)setVacationName:(NSString *)vacationName {
    
    [_vacationName release];
    [vacationName retain];
    _vacationName = vacationName;
    [VacationHelper openVacation:vacationName usingBlock:^(UIManagedDocument *document) {
        NSLog(@"...fetching place");
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Place"];
        NSSortDescriptor *sortDesc = [NSSortDescriptor sortDescriptorWithKey:@"visitedDate" ascending:YES];
        request.sortDescriptors = [NSArray arrayWithObject:sortDesc];
        
        self.places = [document.managedObjectContext executeFetchRequest:request error:nil];
        NSLog(@"%@",self.places);
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.places count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"] autorelease];
    }
    // Place *place = [self.fetchedResultsController objectAtIndexPath:indexPath];
    Place *place = [self.places objectAtIndex:indexPath.row];
    cell.textLabel.text = place.name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    PhotosCDTableViewController *photosViewController = [[[PhotosCDTableViewController alloc] initWithNibName:@"PhotosCDTableViewController" bundle:nil] autorelease];
    //Place *place = [self.fetchedResultsController objectAtIndexPath:indexPath];
    Place *place = [self.places objectAtIndex:indexPath.row];
    photosViewController.place = place;
    [self.navigationController pushViewController:photosViewController animated:YES];
}
@end
