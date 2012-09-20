//
//  MyPickerDelegate.m
//  26-APicker-chap13
//
//  Created by exoplatform on 9/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MyPickerDelegate.h"

@implementation MyPickerDelegate
@synthesize myData;

- (id) init {
    if([super init] == nil) return nil;
    myData = [[NSArray alloc] initWithObjects:@"Tuan", @"Phi", @"Quang", @"Duong", @"Tu", nil];
    return self;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"Picked row: %i, component: %i", row, component);
    NSLog(@"the value: %@", [self.myData objectAtIndex:row]);
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.myData count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.myData objectAtIndex:row];
}

- (void) dealloc {
    [myData release];
    [super dealloc];
}
@end
