//
//  DetailViewController.h
//  Interactive Map
//
//  Created by Yisha Fang on 11/4/15.
//  Copyright (c) 2015 Yisha Fang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BuildingDetail.h"

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *distance;
@property (weak, nonatomic) IBOutlet UILabel *time;

@property (strong, nonatomic) BuildingDetail *buildingDetail;

@end
