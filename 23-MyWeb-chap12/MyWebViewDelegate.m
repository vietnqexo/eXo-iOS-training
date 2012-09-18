//
//  MyWebViewDelegate.m
//  23-MyWeb-chap12
//
//  Created by exoplatform on 9/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MyWebViewDelegate.h"

@implementation MyWebViewDelegate

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"%@", [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.textContent"]);
}

@end
