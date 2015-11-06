//
//  ViewController.m
//  Interactive Map
//
//  Created by Yisha Fang on 10/29/15.
//  Copyright (c) 2015 Yisha Fang. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()  <UIScrollViewDelegate, UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) IBOutlet UIView *highlightView;

@property (strong, nonatomic) IBOutlet UIImageView *currentLocation;

@property (strong, nonatomic) NSArray *array;

@end

@implementation ViewController
@synthesize imageView;
@synthesize scrollView;
@synthesize highlightView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.scrollView.delegate = self;
    self.scrollView.contentSize = self.imageView.image.size;
    self.imageView.frame = CGRectMake(0, 0, self.imageView.image.size.width, self.imageView.image.size.height);
    self.imageView.userInteractionEnabled = YES;
    
    self.array = [[NSArray alloc] initWithObjects:@"King Library", @"Engineering Building", @"Yoshihiro Uchida Hall", @"Student Union", @"BBC", @"South Parking Garage", nil];
    
    // Hard code user current location for testing
    self.currentLocation = [[UIImageView alloc] initWithFrame:CGRectMake(529, 188, 5, 5)];
    self.currentLocation.opaque = 1;
    self.currentLocation.backgroundColor = [UIColor redColor];
    [scrollView addSubview:self.currentLocation];
    
    // Set user current location as a small red circle
    self.currentLocation.clipsToBounds = YES;
    [self setRoundedView:_currentLocation toDiameter:15.0];
    
    UITapGestureRecognizer *rec = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapRecognized:)];
    [scrollView addGestureRecognizer:rec];
    NSLog(@"cool");
}

- (void)tapRecognized:(UITapGestureRecognizer *)recognizer {
    NSLog(@"In tapRecognized!");
    if (recognizer.state == UIGestureRecognizerStateRecognized) {
        CGPoint point = [recognizer locationInView:recognizer.view];
        // point.x and point.y have the coordinates of the touch
        NSLog(@"%lf %lf", point.x, point.y);
        
        // open detail view controller
//        self.detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
//        [self presentedViewController:self.detailViewController animated:YES completion:nil];
    }
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    // return which subview we want to zoom
    return self.imageView;
}

- (void)viewDidUnload {
    [self setImageView:nil];
    [self setScrollView:nil];
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/* Set UIImageView to circle shape */
-(void)setRoundedView:(UIImageView *)roundedView toDiameter:(float)newSize {
    CGPoint saveCenter = roundedView.center;
    CGRect newFrame = CGRectMake(roundedView.frame.origin.x, roundedView.frame.origin.y, newSize, newSize);
    roundedView.frame = newFrame;
    roundedView.layer.cornerRadius = newSize / 2.0;
    roundedView.center = saveCenter;
}

#pragma Search Methods

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    // Delete previous highlight
    if ([self.highlightView isDescendantOfView:scrollView]) {
        [self.highlightView removeFromSuperview];
    }
    
    NSString *inputStr = searchBar.text;
    NSLog(@"%@", inputStr);
    
    Boolean hasBuilding =false;
    for (int i = 0; i < [self.array count]; i++) {
        NSString *buildingName = [self.array objectAtIndex:i];
        //NSLog(@"name in array is: %@", buildingName);
        if ([inputStr isEqualToString:buildingName]) {
            hasBuilding = true;
            break;
        } else {
            hasBuilding = false;
        }
    }
    
    if (hasBuilding) {
        NSLog(@"has building: %@ ", inputStr);
        [self highlightBuilding:inputStr];
    } else {
        NSLog(@"No result.");
    }
}

/* Highlight the building which user is searing for */
- (void)highlightBuilding:(NSString *)building {
    //NSLog(@"In highlightBuilding");
    
    if ([building isEqualToString:[self.array objectAtIndex:0]]) {  // King Library
        self.highlightView = [[UIView alloc] initWithFrame:CGRectMake(86, 196, 68, 85)];
    } else if ([building isEqualToString:[self.array objectAtIndex:1]]) {  // Engineering Building
        self.highlightView = [[UIView alloc] initWithFrame:CGRectMake(358, 196, 95, 97)];
    } else if ([building isEqualToString:[self.array objectAtIndex:2]]) {  // Yoshihiro Uchida Hall
        self.highlightView = [[UIView alloc] initWithFrame:CGRectMake(82, 409, 63, 63)];
    } else if ([building isEqualToString:[self.array objectAtIndex:3]]) {  // Student Union
        self.highlightView = [[UIView alloc] initWithFrame:CGRectMake(354, 311, 116, 50)];
    } else if ([building isEqualToString:[self.array objectAtIndex:4]]) {  // BBC
        self.highlightView = [[UIView alloc] initWithFrame:CGRectMake(552, 359, 63, 50)];
    } else if ([building isEqualToString:[self.array objectAtIndex:5]]) {  // South Parking Garage
        self.highlightView = [[UIView alloc] initWithFrame:CGRectMake(219, 570, 107, 74)];
    }
    
    self.highlightView.alpha = 0.3;
    self.highlightView.backgroundColor = [UIColor redColor];
    
    [scrollView addSubview:self.highlightView];
}

@end
