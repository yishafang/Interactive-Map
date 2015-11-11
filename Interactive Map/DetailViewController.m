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
    
    // Add distance and time later!
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.name.text = _buildingDetail.name;
    self.address.text = _buildingDetail.address;
    [self.photo setContentMode:UIViewContentModeScaleAspectFit];
    self.photo.image = [UIImage imageNamed:_buildingDetail.imageFile];
    
    
}
- (IBAction)close:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
