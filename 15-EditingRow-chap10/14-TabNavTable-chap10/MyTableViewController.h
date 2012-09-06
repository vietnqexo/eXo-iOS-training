//
//  MyTableViewController.h
//  14-TabNavTable-chap10
//
//  Created by exoplatform on 8/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyDetailController.h"
#import "AddItemViewController.h"

@interface MyTableViewController : UITableViewController {
    NSMutableArray *tableDataList;
    AddItemViewController *addItemController;
    UIBarButtonItem *addButton;

}
@property (nonatomic, retain) NSMutableArray *tableDataList;
@property (nonatomic, retain) AddItemViewController *addItemController;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *addButton;

- (void)exitAndSave:(NSString *) newValue;
- (void)enterAddMode:(id)sender;
@end
