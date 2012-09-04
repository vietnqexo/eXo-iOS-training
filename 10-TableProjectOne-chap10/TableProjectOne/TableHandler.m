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
    NSArray *tmpArray = [[NSArray alloc] initWithObjects:@"Item 1",@"Item 2", @"Item 3", @"Item 4",@"Item 5",@"Item 6", @"Item 7", @"Item 8", @"Item 9", @"Item 10", nil];
    self.tableDataList = tmpArray;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tableDataList count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"acell"];
    if(cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"acell"] autorelease];   
    }
    cell.textLabel.text = [self.tableDataList objectAtIndex:[indexPath row]];
    return cell;
}

- (void) dealloc {
    [tableDataList release];
    [super dealloc];
}

@end
