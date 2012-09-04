//
//  MyViewController.h
//  TableProjectOne
//
//  Created by exoplatform on 8/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableHandler.h"
@interface MyViewController : UIViewController {
    TableHandler *myHandler;
}
@property (nonatomic, retain) IBOutlet TableHandler *myHandler;

@end
