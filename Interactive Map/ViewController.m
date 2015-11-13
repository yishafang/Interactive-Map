//
//  ViewController.m
//  Interactive Map
//
//  Created by Yisha Fang on 10/29/15.
//  Copyright (c) 2015 Yisha Fang. All rights reserved.
//

#import "ViewController.h"
#import "BuildingDetail.h"
#import "DetailViewController.h"

@interface ViewController ()  <UIScrollViewDelegate, UISearchBarDelegate, CLLocationManagerDelegate>
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *highlightView;
@property (strong, nonatomic) IBOutlet UIView *subView;
@property (strong, nonatomic) IBOutlet UIImageView *currentLocation;

@property (nonatomic) int selected;

@property (strong, nonatomic) NSArray *array;
@property (strong, nonatomic) NSArray *details;
@end

@implementation ViewController
@synthesize imageView;
@synthesize scrollView;
@synthesize highlightView;
CLLocationManager *locationManager;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Initialize building data
    BuildingDetail *KL = [BuildingDetail new];
    KL.name = @"King Library";
    KL.address = @"Dr. Martin Luther King, Jr. Library, 150 East San Fernando Street, San Jose, CA 95112";
    KL.imageFile = @"kingLibrary.jpg";
    
    BuildingDetail *EB = [BuildingDetail new];
    EB.name = @"Engineering Building";
    EB.address = @"San José State University Charles W. Davidson College of Engineering, 1 Washington Square, San Jose, CA 95112";
    EB.imageFile = @"engineeringBuilding.jpg";
    
    BuildingDetail *YUH = [BuildingDetail new];
    YUH.name = @"Yoshihiro Uchida Hall​";
    YUH.address = @"Yoshihiro Uchida Hall, San Jose, CA 95112";
    YUH.imageFile = @"YUH.jpg";
    
    BuildingDetail *SU = [BuildingDetail new];
    SU.name = @"Student Union";
    SU.address = @"Student Union Building, San Jose, CA 95112";
    SU.imageFile = @"studentUnion.jpg";
    
    BuildingDetail *BBC = [BuildingDetail new];
    BBC.name = @"BBC";
    BBC.address = @"Boccardo Business Complex, San Jose, CA 95112";
    BBC.imageFile = @"BBC.jpg";
    
    BuildingDetail *SPG = [BuildingDetail new];
    SPG.name = @"South​ ​Parking​ ​Garage";
    SPG.address = @"San Jose State University South Garage, 330 South 7th Street, San Jose, CA 95112";
    SPG.imageFile = @"SPG.png";

    
    self.details = [NSArray arrayWithObjects:KL,EB,YUH,SU,BBC,SPG, nil];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
    self.scrollView.minimumZoomScale = 0.3f;
    self.scrollView.maximumZoomScale = 3.0f;
    self.scrollView.contentSize = self.imageView.image.size;
    self.scrollView.delegate = self;
    
    self.imageView.frame = CGRectMake(0, 0, self.imageView.image.size.width, self.imageView.image.size.height);
    self.imageView.userInteractionEnabled = YES;
    
    self.array = [[NSArray alloc] initWithObjects:@"King Library", @"Engineering Building", @"Yoshihiro Uchida Hall", @"Student Union", @"BBC", @"South Parking Garage", nil];
    
    //user's location.
//    locationManager = [[CLLocationManager alloc] init];
//    locationManager.delegate = self;
//    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
//    [locationManager requestAlwaysAuthorization];
//    [locationManager requestWhenInUseAuthorization];
//    [locationManager startUpdatingLocation];
//    CLLocation *location = [locationManager location];
//    float longitude=location.coordinate.longitude;
//    float latitude=location.coordinate.latitude;
    //test
    float longitude = -121.881557;
    float latitude = 37.335706;
    float x =660-(660 * (121.885975-fabs(longitude))/(121.885975 -121.876565));
    float y =(694 - (694 * (latitude-37.331361)/(37.338800-37.331361)));
    self.currentLocation = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, 5, 5)];
    self.currentLocation.opaque = 1;
    self.currentLocation.backgroundColor = [UIColor redColor];
    [imageView addSubview:self.currentLocation];
    
    // Set user current location as a small red circle
    self.currentLocation.clipsToBounds = YES;
    [self setRoundedView:_currentLocation toDiameter:15.0];
    
    UITapGestureRecognizer *rec = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self action:@selector(tapRecognized:)];
    [scrollView addGestureRecognizer:rec];
    NSLog(@"cool");
}


- (void)tapRecognized:(UITapGestureRecognizer *)recognizer {
    NSLog(@"In tapRecognized!");
    if (recognizer.state == UIGestureRecognizerStateRecognized) {
        CGPoint point = [recognizer locationInView:recognizer.view];
        if(point.x>73 && point.x<73+48 && point.y>194 &&point.y<194+87){
            self.selected = 0;
        }else if(point.x>342 && point.x<342+93 && point.y>196 &&point.y<196+102){
            self.selected = 1;
        }else if(point.x>62 && point.x<62+66 && point.y>407 &&point.y<407+65){
            self.selected = 2;
        }else if(point.x>337 && point.x<337+86 && point.y>311 &&point.y<311+40){
            self.selected = 3;
        }else if(point.x>530 && point.x<530+63 && point.y>359 &&point.y<359+50){
            self.selected = 4;
        }else if(point.x>197 && point.x<197+113 && point.y>570 &&point.y<570+77){
            self.selected = 5;
        }
        [self performSegueWithIdentifier:@"detail" sender:self];

        NSLog(@"%lf %lf", point.x, point.y);
    }
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    // return which subview we want to zoom
    return self.imageView;
//    [self.scrollView addSubview:self.subView];
//    return [self.scrollView.subviews objectAtIndex:0];
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"detail"]) {
        DetailViewController *detailViewController = segue.destinationViewController;
        detailViewController.buildingDetail =[_details objectAtIndex:_selected];
    }
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
    if ([building isEqualToString:[self.array objectAtIndex:0]]) {  // King Library
        [self zoomMapAndCenterAtPointX:73+48/2 andPointY:194+87/2];
        self.highlightView = [[UIView alloc] initWithFrame:CGRectMake(73, 194, 48, 87)];
    } else if ([building isEqualToString:[self.array objectAtIndex:1]]) {  // Engineering Building
        [self zoomMapAndCenterAtPointX:342+93/2 andPointY:196+102/2];
        self.highlightView = [[UIView alloc] init];
        [highlightView setFrame: CGRectMake(342, 196, 93, 102)];
    } else if ([building isEqualToString:[self.array objectAtIndex:2]]) {  // Yoshihiro Uchida Hall
        [self zoomMapAndCenterAtPointX:62+66/2 andPointY:407+65/2];
        self.highlightView = [[UIView alloc] initWithFrame:CGRectMake(62, 407, 66, 65)];
    } else if ([building isEqualToString:[self.array objectAtIndex:3]]) {  // Student Union
        [self zoomMapAndCenterAtPointX:337+86/2 andPointY:309+40/2];
        self.highlightView = [[UIView alloc] initWithFrame:CGRectMake(337, 311, 86, 40)];
    } else if ([building isEqualToString:[self.array objectAtIndex:4]]) {  // BBC
        [self zoomMapAndCenterAtPointX:530+63/2 andPointY:359+50/2];
        self.highlightView = [[UIView alloc] initWithFrame:CGRectMake(530, 359, 63, 50)];
    } else if ([building isEqualToString:[self.array objectAtIndex:5]]) {  // South Parking Garage
        [self zoomMapAndCenterAtPointX:197+113/2 andPointY:570+77/2];
        self.highlightView = [[UIView alloc] initWithFrame:CGRectMake(197, 570, 113, 77)];
    }
    
    self.highlightView.alpha = 0.3;
    self.highlightView.backgroundColor = [UIColor redColor];
    
    [imageView addSubview:self.highlightView];
}

/* Zoom map and center at pointX and pointY */

-(void)zoomMapAndCenterAtPointX:(double) x andPointY:(double) y {
    CGRect zoomRect;
    zoomRect.size.height = scrollView.frame.size.height;
    zoomRect.size.width  = scrollView.frame.size.width;
    
    zoomRect.origin.x = x - (zoomRect.size.width  / 2.0);
    zoomRect.origin.y = y - (zoomRect.size.height / 2.0);
    [scrollView zoomToRect:zoomRect animated:YES];
    
}

@end
