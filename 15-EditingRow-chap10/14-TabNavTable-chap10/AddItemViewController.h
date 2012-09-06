//
//  AddItemViewController.h
//  14-TabNavTable-chap10
//
//  Created by exoplatform on 9/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyTableViewController;
@interface AddItemViewController : UIViewController {
    MyTableViewController *parentTable;
    UIBarButtonItem *doneButton;
    UITextField *textField;
    
}

@property (nonatomic, retain) IBOutlet UITextField *textField;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *doneButton;
@property (nonatomic, retain) MyTableViewController *parentTable;
@end
