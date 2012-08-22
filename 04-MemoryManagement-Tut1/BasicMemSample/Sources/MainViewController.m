//
//  MainViewController.m
//  BasicMemSample
//
//  Created by exoplatform on 8/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

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

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    _sushiTypes = [[NSArray alloc] initWithObjects:@"California Roll", 
                   @"Tuna Roll", @"Salmon Roll", @"Unagi Roll", 
                   @"Philadelphia Roll", @"Rainbow Roll",
                   @"Vegetable Roll", @"Spider Roll", 
                   @"Shrimp Tempura Roll", @"Cucumber Roll",
                   @"Yellowtail Roll", @"Spicy Tuna Roll",
                   @"Avocado Roll", @"Scallop Roll",
                   nil];
 
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [_sushiTypes release];
    _sushiTypes = nil;
}

- (void)dealloc {
    [_sushiTypes release];
    _sushiTypes = nil;
    [_lastSushiSelected release];
    _lastSushiSelected = nil;
    [super dealloc];
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
	return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _sushiTypes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    NSString * sushiName = [_sushiTypes objectAtIndex:indexPath.row]; // 1
    NSString * sushiString = 
    [[NSString alloc] initWithFormat:@"%d: %@", 
     indexPath.row, sushiName]; // 2
    cell.textLabel.text = sushiString; // 3
    [sushiString release]; // 4
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
    NSString *sushiName = [_sushiTypes objectAtIndex:indexPath.row];
    NSString *sushiString = [NSString stringWithFormat:@"%d: %@", indexPath.row, sushiName];
    NSString *message = [NSString stringWithFormat:@"Last sushi: %@. Current sushi: %@", _lastSushiSelected, sushiString];
    UIAlertView *alertView = [[[UIAlertView alloc] initWithTitle:@"Sushi power!" message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK!", nil] autorelease];
    [alertView show];
    [_lastSushiSelected release];
    _lastSushiSelected = [sushiString retain];
}

@end
