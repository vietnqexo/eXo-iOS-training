//
//  TopPlaceViewController.m
//  30-TopPlaces
//
//  Created by exoplatform on 10/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TopPlaceViewController.h"
#import "PhotoDetailController.h"
#import "FlickrFetcher.h"
#import "MyCell.h"
#import "PhotosForLocation.h"
#import "PlaceAnnotation.h"
#import "Utils.h"

@implementation TopPlaceViewController

@synthesize topPlaces = _topPlaces;
@synthesize countries = _countries;
@synthesize countryPlaceDict = _countryPlaceDict;

- (void) dealloc {
    [_topPlaces release];
    [_countries release];
    [_countryPlaceDict release];
    [super dealloc];

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        self.title = NSLocalizedString(@"Top Places", @"Top Places");
        self.tabBarItem.image = [UIImage imageNamed:@"star"];

    }
    return self;
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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

#pragma mark - MapViewControllerDelegate

-(NSArray*) mapAnnotations
{
    NSMutableArray *annotations = [NSMutableArray arrayWithCapacity:[self.topPlaces count]];
    for (NSString* country in self.countries) 
        for (NSDictionary *place in [self.countryPlaceDict valueForKey:country])
            [annotations addObject:[PlaceAnnotation annotationForPlace:place]];
    
    return annotations;
}

-(BOOL) annotationHasThumbnail
{
    return NO;
}

-(void) showPhotoForAnnotation:(id <MKAnnotation>)annotation
{
    PhotosForLocation *photosForLocation = [[PhotosForLocation alloc] initWithNibName:@"PhotosForLocation" bundle:nil];
    photosForLocation.location = ((PlaceAnnotation *)annotation).place;
    [self.navigationController pushViewController:photosForLocation animated:YES];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Map" style:UIBarButtonItemStylePlain target:self action:@selector(showPlaceMap:)] autorelease];
    
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
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [spinner startAnimating];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:spinner];
    
    dispatch_queue_t fetchTopPlacesQueue = dispatch_queue_create("fetchTopPlaces", NULL);
    dispatch_async(fetchTopPlacesQueue, ^{
        NSMutableArray *topPlacesTmp = [[FlickrFetcher topPlaces] mutableCopy];
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"_content" ascending:YES];
        
        NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
        
        self.topPlaces = [topPlacesTmp sortedArrayUsingDescriptors:sortDescriptors];
        self.countryPlaceDict = [Utils selectTopPlaces:self.topPlaces];
        self.countries = [[self.countryPlaceDict allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.navigationItem.leftBarButtonItem = nil;
            [self.tableView reloadData];
        });
    });
    dispatch_release(fetchTopPlacesQueue);
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
    return [topPlaces count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCell *cell = (MyCell *) [tableView dequeueReusableCellWithIdentifier:@"My Cell"];
    if(cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MyCell" owner:self options:nil] objectAtIndex:0];
    }
    // Configure the cell...
    NSDictionary *topPlace = [self.topPlaces objectAtIndex:indexPath.row];
    NSString *longCityName = [topPlace objectForKey:@"_content"];
    
    NSArray *splitName = [longCityName componentsSeparatedByString:@", "];
    
    cell.textLabel.text = [splitName objectAtIndex:0];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [splitName componentsJoinedByString:@", "]];
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PhotosForLocation *photosForLocation = [[PhotosForLocation alloc] initWithNibName:@"PhotosForLocation" bundle:nil];
    photosForLocation.location = [self.topPlaces objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:photosForLocation animated:YES];
}


- (IBAction)showPlaceMap:(id)sender {
    MapViewController *mapViewController = [[MapViewController alloc] initWithNibName:@"MapViewController" bundle:nil];
    mapViewController.delegate = self;
    [mapViewController setAnnotations:[self mapAnnotations]];
    [mapViewController setModalTransitionStyle:UIModalTransitionStylePartialCurl];
    [self.navigationController pushViewController:mapViewController animated:YES];
}
@end
