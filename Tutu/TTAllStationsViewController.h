//
//  TTAllStationsViewController.h
//  Tutu
//
//  Created by Artyom Ryzhkov on 07/02/16.
//  Copyright © 2016 Yulia Kashirina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Station.h"

@protocol TTSearchStationProtocol <NSObject>

- (void)setStation:(Station *)station forDirection:(TTStationType)stationType;

@end

@interface TTAllStationsViewController : UIViewController

@property (strong, nonatomic) id <TTSearchStationProtocol> delegate;
@property (assign, nonatomic) TTStationType stationType;

@end
