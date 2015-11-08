//
//  DetailViewController.m
//  Interactive Map
//
//  Created by Yisha Fang on 11/4/15.
//  Copyright (c) 2015 Yisha Fang. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.name.text = _buildingDetail.name;
    self.address.text = _buildingDetail.address;
    self.photo.image = [UIImage imageNamed:_buildingDetail.imageFile];
    // Add distance and time later!
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
