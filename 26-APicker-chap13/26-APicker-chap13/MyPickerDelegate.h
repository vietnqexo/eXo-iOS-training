//
//  MyPickerDelegate.h
//  26-APicker-chap13
//
//  Created by exoplatform on 9/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyPickerDelegate : NSObject <UIPickerViewDelegate, UIPickerViewDataSource> {
    NSArray *myData;
}
@property (nonatomic, retain) NSArray *myData;
@end
