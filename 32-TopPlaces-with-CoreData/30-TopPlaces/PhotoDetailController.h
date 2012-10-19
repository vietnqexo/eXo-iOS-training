//
//  PhotoDetailController.h
//  30-TopPlaces
//
//  Created by exoplatform on 10/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoDetailController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) NSDictionary *photoInfo;
@property (nonatomic,retain) UIImageView *imageView;
@property (nonatomic, retain) UIBarButtonItem *visitButton;
@property (assign) BOOL photoVisited;

- (void) centerScrollViewContents;
- (void) displayPhoto: (NSDictionary *)photoInfo;
- (void) checkVisitOrUnvisit;
- (IBAction)visitOrUnvisit:(id)sender;
@end
