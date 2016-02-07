//
//  TTScheduleViewController.m
//  Tutu
//
//  Created by Artyom Ryzhkov on 07/02/16.
//  Copyright © 2016 Yulia Kashirina. All rights reserved.
//

#import "TTScheduleViewController.h"
#import "TTAllStationsViewController.h"

@interface TTScheduleViewController ()

@property (strong, nonatomic) TTAllStationsViewController *allStationsVC;

@end

@implementation TTScheduleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.allStationsVC = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass(TTAllStationsViewController.class)];
}

- (IBAction)stationFromButtonPressed:(id)sender {
    self.allStationsVC.stationType = TTStationFrom;
    UIViewController *vc = self.view.window.rootViewController;
    [vc presentViewController:self.allStationsVC animated:YES completion:nil];
}

- (IBAction)stationToButtonPressed:(id)sender {
    self.allStationsVC.stationType = TTStationTo;
    UIViewController *vc = self.view.window.rootViewController;
    [vc presentViewController:self.allStationsVC animated:YES completion:nil];
}


@end
