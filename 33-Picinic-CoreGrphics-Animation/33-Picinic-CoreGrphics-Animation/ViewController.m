//
//  ViewController.m
//  33-Picinic-CoreGrphics-Animation
//
//  Created by exoplatform on 11/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize basketTop;
@synthesize basketBottom;
@synthesize napkinTop;
@synthesize napkinBottom;
@synthesize bug;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:self.view];
    CGRect bugRect = [[[bug layer] presentationLayer] frame];
    if(CGRectContainsPoint(bugRect, touchLocation)) {
        NSLog(@"Bug tapped");
        bugDead = true;
        [UIView animateWithDuration:0.7 delay:0.0 options:UIViewAnimationCurveEaseInOut animations:^{
            bug.transform = CGAffineTransformMakeScale(1.25,0.75);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:2.0 delay:2.0 options:0 animations:^{
                bug.alpha = 0.0;
            } completion:^(BOOL finished) {
                [bug removeFromSuperview];
                bug = nil;
            }];
        }];
            
        } else {
            NSLog(@"Bug not tapped");
        }
         
         }
         // Add two new methods
         - (void)moveToLeft:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
             if(bugDead) return;
             [UIView beginAnimations:nil context:nil];
             [UIView setAnimationDuration:1.0];
             [UIView setAnimationDelay:2.0];
             [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
             [UIView setAnimationDelegate:self];
             [UIView setAnimationDidStopSelector:@selector(faceRight:finished:context:)];
             bug.center = CGPointMake(75, 200);
             [UIView commitAnimations];
             
         }
         
         - (void)faceRight:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
             if(bugDead) return;
             [UIView beginAnimations:nil context:nil];
             [UIView setAnimationDuration:1.0];
             [UIView setAnimationDelay:0.0];
             [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
             [UIView setAnimationDelegate:self];
             [UIView setAnimationDidStopSelector:@selector(moveToRight:finished:context:)];
             bug.transform = CGAffineTransformMakeRotation(M_PI);
             [UIView commitAnimations];
             
         }
         
         - (void)moveToRight:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
             if(bugDead) return;
             [UIView beginAnimations:nil context:nil];
             [UIView setAnimationDuration:1.0];
             [UIView setAnimationDelay:2.0];
             [UIView setAnimationDelegate:self];
             [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
             [UIView setAnimationDidStopSelector:@selector(faceLeft:finished:context:)];
             bug.center = CGPointMake(230, 250);
             [UIView commitAnimations];
             
         }
         
         - (void)faceLeft:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
             if(bugDead) return;
             [UIView beginAnimations:nil context:nil];
             [UIView setAnimationDuration:1.0];
             [UIView setAnimationDelay:0.0];
             [UIView setAnimationDelegate:self];
             [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
             [UIView setAnimationDidStopSelector:@selector(moveToLeft:finished:context:)];
             bug.transform = CGAffineTransformMakeRotation(0);
             [UIView commitAnimations];
             
         }
#pragma mark - View lifecycle
         
         - (void)viewDidLoad
        {
            [super viewDidLoad];
            // Do any additional setup after loading the view, typically from a nib.
            CGRect basketTopFrame = basketTop.frame;
            basketTopFrame.origin.y = -basketTopFrame.size.height;
            
            CGRect basketBottomFrame = basketBottom.frame;
            basketBottomFrame.origin.y = self.view.bounds.size.height;
            
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.5];
            [UIView setAnimationDelay:1.0];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
            
            basketTop.frame = basketTopFrame;
            basketBottom.frame = basketBottomFrame;
            
            [UIView commitAnimations];
            
            CGRect napkinTopFrame = napkinTop.frame;
            napkinTopFrame.origin.y = -napkinTopFrame.size.height;    
            CGRect napkinBottomFrame = napkinBottom.frame;
            napkinBottomFrame.origin.y = self.view.bounds.size.height;
            
            [UIView animateWithDuration:0.7
                                  delay:1.2
                                options: UIViewAnimationCurveEaseOut
                             animations:^{
                                 napkinTop.frame = napkinTopFrame;
                                 napkinBottom.frame = napkinBottomFrame;
                             } 
                             completion:^(BOOL finished){
                                 NSLog(@"Done!");
                             }];
            
            [self moveToLeft:nil finished:nil context:nil];
            
        }
         
         - (void)viewDidUnload
        {
            [super viewDidUnload];
            // Release any retained subviews of the main view.
            // e.g. self.myOutlet = nil;
        }
         
         - (void)viewWillAppear:(BOOL)animated
        {
            [super viewWillAppear:animated];
        }
         
         - (void)viewDidAppear:(BOOL)animated
        {
            [super viewDidAppear:animated];
        }
         
         - (void)viewWillDisappear:(BOOL)animated
        {
            [super viewWillDisappear:animated];
        }
         
         - (void)viewDidDisappear:(BOOL)animated
        {
            [super viewDidDisappear:animated];
        }
         
         - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
        {
            // Return YES for supported orientations
            return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
        }
         
         @end
