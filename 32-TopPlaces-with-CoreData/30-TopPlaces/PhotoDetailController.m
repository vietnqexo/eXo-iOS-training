//
//  PhotoDetailController.m
//  30-TopPlaces
//
//  Created by exoplatform on 10/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PhotoDetailController.h"
#import "FlickrFetcher.h"
#import "Utils.h"
#import "VacationHelper.h"
#import "Photo+Flickr.h"
#import "VacationsViewController.h"


@implementation PhotoDetailController 
@synthesize photoInfo = _photoInfo;
@synthesize scrollView = _scrollView;
@synthesize imageView = _imageView;
@synthesize visitButton = _visitButton;
@synthesize photoVisited = _photoVisited;

- (void) dealloc {
    [_photoInfo release];
    [_scrollView release];
    [_imageView release];
    [_visitButton release];
    [super dealloc];
    
}
- (void)checkVisitOrUnvisit {
    [VacationHelper openVacation:MY_VACATION usingBlock:^(UIManagedDocument *document) {
        if ([Photo photoIsExisted:self.photoInfo inManagedObjectContext:document.managedObjectContext]) {
            self.photoVisited = YES;
            self.visitButton.title = @"Unvisit";
            
        } else {
            self.photoVisited = NO;
            self.visitButton.title = @"Visit";
        }
    }];
}

- (void)visitOrUnvisit:(id)sender {
    if (!self.photoVisited) {

        [VacationHelper openVacation:MY_VACATION usingBlock:^(UIManagedDocument *document) {
            if ([Photo photoWithFlickrInfo:self.photoInfo inManagedObjectContext:document.managedObjectContext]) {
                self.photoVisited = YES;
                self.visitButton.title = @"Unvisit";
            };
            
        }];
    } else {
        [VacationHelper openVacation:MY_VACATION usingBlock:^(UIManagedDocument *document) {
            Photo *photo = [Photo photoWithFlickrInfo:self.photoInfo inManagedObjectContext:document.managedObjectContext];
            if (photo) {
                 
                [document.managedObjectContext deleteObject:photo];
                self.photoVisited = NO;
                self.visitButton.title = @"Visit";
            }
        }];
    }
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
    self.visitButton = [[UIBarButtonItem alloc] initWithTitle:@"Visit" style:UIBarButtonItemStylePlain target:self action:@selector(visitOrUnvisit:)];
    [self checkVisitOrUnvisit];
    self.navigationItem.rightBarButtonItem = self.visitButton;
    [Utils pushPhotoToList:self.photoInfo];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self displayPhoto:self.photoInfo];
    
}

- (void)displayPhoto:(NSDictionary *)photoInfo {
    self.title = [Utils titleForPhoto:photoInfo];
    // fetch the image
    NSData *photoData = [NSData dataWithContentsOfURL:[FlickrFetcher urlForPhoto:self.photoInfo format:FlickrPhotoFormatLarge]];
    
    UIImage *photo = [UIImage imageWithData:photoData];
    
    self.imageView = [[UIImageView alloc] initWithImage:photo];
    self.imageView.frame = (CGRect){.origin=CGPointMake(0.0f, 0.0f), .size=photo.size};
    [self.scrollView addSubview:self.imageView];
    
    self.scrollView.contentSize = photo.size;
    
    CGRect scrollViewFrame = self.scrollView.frame;
    CGFloat scaleWidth = scrollViewFrame.size.width / self.scrollView.contentSize.width;
    CGFloat scaleHeight = scrollViewFrame.size.height / self.scrollView.contentSize.height;
    CGFloat minScale = MIN(scaleWidth, scaleHeight);
    
    self.scrollView.minimumZoomScale = minScale;
    
    self.scrollView.maximumZoomScale = 1.0f;
    self.scrollView.zoomScale = minScale;
    
    [self centerScrollViewContents];
}

- (void)centerScrollViewContents {
    CGSize boundsSize = self.scrollView.bounds.size;
    CGRect contentsFrame = self.imageView.frame;
    
    if (contentsFrame.size.width < boundsSize.width) {
        contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0f;
    } else {
        contentsFrame.origin.x = 0.0f;
    }
    
    if (contentsFrame.size.height < boundsSize.height) {
        contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0f;
    } else {
        contentsFrame.origin.y = 0.0f;
    }
    
    self.imageView.frame = contentsFrame;
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
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}
@end
