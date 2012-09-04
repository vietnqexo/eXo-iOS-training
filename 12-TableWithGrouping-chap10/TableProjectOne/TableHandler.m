//
//  TableHandler.m
//  TableProjectOne
//
//  Created by exoplatform on 8/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TableHandler.h"

@implementation TableHandler

@synthesize tableDataList;

- (id)init {
    if (self = [super init]) {
        [self fillList];
    }
    return self;
}

- (void) fillList {
    NSArray *tmpArrayA = [[[NSArray alloc] initWithObjects:@"Item 1A",@"Item 2A", @"Item 3A", nil] autorelease];
    NSArray *tmpArrayB = [[[NSArray alloc] initWithObjects:@"Item 1B",@"Item 2B", @"Item 3B", nil]autorelease];
    NSArray *tmpArrayC = [[[NSArray alloc] initWithObjects:@"Item 1C",@"Item 2C", @"Item 3C", nil] autorelease];
    NSArray *tmpArray = [[[NSArray alloc] initWithObjects:tmpArrayA,tmpArrayB,tmpArrayC, nil] autorelease];
    self.tableDataList = tmpArray;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.tableDataList count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0: return @"A"; break;
        case 1: return @"B"; break;
        case 2: return @"C"; break;
    }
    return nil;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.tableDataList objectAtIndex:section] count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"acell"];
    if(cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"acell"] autorelease];   
    }
    cell.textLabel.text = [[self.tableDataList objectAtIndex:[indexPath section]] objectAtIndex:[indexPath row]];
    UIImage *image;
    switch (indexPath.section) {
        case 0: image = [UIImage imageNamed:@"abacus.png"];
            cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
            break;
        case 1: image = [UIImage imageNamed:@"airplane"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        case 2: image = [UIImage imageNamed:@"animal-footprint.png"];
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            break;
    }
    cell.imageView.image = image;
    return cell;
}

- (NSArray *) sectionIndexTitlesForTableView:(UITableView *)tableView {
    NSArray *keys = [[NSArray alloc] initWithObjects:@"A", @"B", @"C", nil];
    return keys;
}
- (void) dealloc {
    [tableDataList release];
    [super dealloc];
}

@end
