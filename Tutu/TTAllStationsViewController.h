//
//  TTAllStationsViewController.h
//  Tutu
//
//  Created by Artyom Ryzhkov on 07/02/16.
//  Copyright © 2016 Yulia Kashirina. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, TTStationType) {
    TTStationFrom,
    TTStationTo
};

@interface TTAllStationsViewController : UIViewController

@property (assign, nonatomic) TTStationType stationType;

@end
