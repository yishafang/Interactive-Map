//
//  ViewController.h
//  Interactive Map
//
//  Created by Yisha Fang on 10/29/15.
//  Copyright (c) 2015 Yisha Fang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface ViewController : UIViewController <UISearchDisplayDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;

@end

