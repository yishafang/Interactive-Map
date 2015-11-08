//
//  BuildingDetail.h
//  Interactive Map
//
//  Created by Yisha Fang on 11/7/15.
//  Copyright (c) 2015 Yisha Fang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BuildingDetail : NSObject

@property (strong, nonatomic) NSString *name;  // name of building
@property (strong, nonatomic) NSString *address;  // building address
@property (strong, nonatomic) NSString *imageFile; // image of building

@end
