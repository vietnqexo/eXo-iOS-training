//
//  PhotosForLocation.m
//  30-TopPlaces
//
//  Created by exoplatform on 10/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PhotosForLocation.h"
#import "FlickrFetcher.h"
#import "PhotoDetailController.h"
#import "PhotoAnnotation.h"
#import "Utils.h"
#define MAX_PHOTOS 50

@implementation PhotosForLocation
@synthesize photos = _photos;
@synthesize location = _location;

- (void) dealloc {
    [self.photos release];
    [self.location release];
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

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - MapViewControllerDelegate

-(NSArray*) mapAnnotations
{
    NSMutableArray *annotations = [NSMutableArray arrayWithCapacity:[self.photos count]];
    for (NSDictionary * photo in self.photos) {
        [annotations addObject:[PhotoAnnotation anotationForPhoto:photo]];
    }
    return annotations;
}

-(BOOL) annotationHasThumbnail
{
    return YES;
}

-(void) showPhotoForAnnotation:(id <MKAnnotation>)annotation
{
    PhotoDetailController *photoDetail = [[PhotoDetailController alloc]initWithNibName:@"PhotoDetailController" bundle:nil];
    photoDetail.photoInfo = ((PhotoAnnotation *)annotation).photo;
    [self.navigationController pushViewController:photoDetail animated:YES];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    
    
    [spinner startAnimating];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:spinner];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Map" style: UIBarButtonItemStylePlain target:self action:@selector(showPhotosMap:)];
    
    NSString *locationName = [self.location objectForKey:@"_content"];
    self.title = [[locationName componentsSeparatedByString:@", "] objectAtIndex:0];
    
    dispatch_queue_t fetchPhotoInfoQueue = dispatch_queue_create("fetchPhotos", NULL);
    dispatch_async(fetchPhotoInfoQueue, ^{
        self.photos = [FlickrFetcher photosInPlace:self.location maxResults:MAX_PHOTOS];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.navigationItem.leftBarButtonItem = nil;
            [self.tableView reloadData];
        });
    });
    dispatch_release(fetchPhotoInfoQueue);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    
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
    return [self.photos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    NSDictionary *photo = [self.photos objectAtIndex:indexPath.row];

    cell.textLabel.text = [Utils titleForPhoto:photo];
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *photo = [self.photos objectAtIndex:indexPath.row];
    
    PhotoDetailController *photoDetail = [[[PhotoDetailController alloc] initWithNibName:@"PhotoDetailController" bundle:nil] autorelease];
    photoDetail.photoInfo = photo;
    [self.navigationController pushViewController:photoDetail animated:YES];
}

- (void)showPhotosMap:(id)sender {
    MapViewController *mapViewController = [[MapViewController alloc] initWithNibName:@"MapViewController" bundle:nil];
    mapViewController.delegate = self;
    [mapViewController setAnnotations:[self mapAnnotations]];
    [self.navigationController pushViewController:mapViewController animated:YES];
}
@end
