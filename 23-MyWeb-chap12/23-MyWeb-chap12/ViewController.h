//
//  ViewController.h
//  23-MyWeb-chap12
//
//  Created by exoplatform on 9/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyWebViewDelegate;

@interface ViewController : UIViewController {
    UITextField *myTextField;
    UIWebView *myWebView;
    MyWebViewDelegate *myWebViewDelegate;
}
@property (nonatomic, retain) IBOutlet UIWebView *myWebView;
@property (nonatomic, retain) IBOutlet UITextField *myTextField;
@property (nonatomic, retain) IBOutlet MyWebViewDelegate *myWebViewDelegate;
- (IBAction)changeLocation:(id)sender;
@end
