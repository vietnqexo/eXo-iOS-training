//
//  MyTableViewController.h
//  14-TabNavTable-chap10
//
//  Created by exoplatform on 8/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyDetailController.h"

@interface MyTableViewController : UITableViewController {
    NSArray *tableDataList;

}
@property (nonatomic, retain) NSArray *tableDataList;

@end
