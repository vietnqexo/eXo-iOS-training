//
//  MasterViewController.m
//  27-ScaryBugs-tut
//
//  Created by exoplatform on 9/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MasterViewController.h"
#import "ScaryBugDoc.h"
#import "ScaryBugData.h"
#import "DetailViewController.h"
@implementation MasterViewController
@synthesize bugs = _bugs;


- (void)awakeFromNib
{
    [super awakeFromNib];
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
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addTapped:)];
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
    [self.tableView reloadData];

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
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.bugs count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyBasicCell"];
    ScaryBugDoc *bug = [self.bugs objectAtIndex:indexPath.row];
    cell.textLabel.text = bug.data.title;
    cell.imageView.image = bug.thumbImage;
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailViewController *detailController = segue.destinationViewController;
    ScaryBugDoc *bug = [self.bugs objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    detailController.detailItem = bug;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if(editingStyle == UITableViewCellEditingStyleDelete) {
        [_bugs removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}
- (void)addTapped:(id)sender {
    ScaryBugDoc *newBug = [[ScaryBugDoc alloc] initWithTitle:@"New Bug" rating:0 thumbImage:nil fullImage:nil];
    [_bugs addObject:newBug]; 
    NSIndexPath *newIndex = [NSIndexPath indexPathForRow:_bugs.count - 1 inSection:0];
    NSArray *array = [NSArray arrayWithObject:newIndex];
    [self.tableView insertRowsAtIndexPaths:array withRowAnimation:YES];
    [self.tableView selectRowAtIndexPath:newIndex animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    [self performSegueWithIdentifier:@"MySeque" sender:self];

}

@end
