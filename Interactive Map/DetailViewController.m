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
    self.photo.image = [UIImage imageNamed:_buildingDetail.imageFile];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.name.text = _buildingDetail.name;
    
    self.address.text = _buildingDetail.address;
//    self.address.lineBreakMode = NSLineBreakByWordWrapping;
//    self.address.numberOfLines = 0;
    
    [self changeImages];
}

-(void) changeImages {
    UIImage *img = [UIImage imageNamed:_buildingDetail.imageFile];
    
    self.photo.contentMode = UIViewContentModeScaleAspectFit;
    self.photo.clipsToBounds = YES;
    [self.photo setImage:img];
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
