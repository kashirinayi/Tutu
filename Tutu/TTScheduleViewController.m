//
//  TTScheduleViewController.m
//  Tutu
//
//  Created by Artyom Ryzhkov on 07/02/16.
//  Copyright © 2016 Yulia Kashirina. All rights reserved.
//

#import "TTScheduleViewController.h"
#import "TTAllStationsViewController.h"

@interface TTScheduleViewController () <TTSearchStationProtocol>

@property (strong, nonatomic) TTAllStationsViewController *allStationsVC;

@property (weak, nonatomic) IBOutlet UITextField *stationFrom;
@property (weak, nonatomic) IBOutlet UITextField *stationTo;

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
    self.allStationsVC.delegate = self;
    [vc presentViewController:self.allStationsVC animated:YES completion:nil];
}

- (IBAction)stationToButtonPressed:(id)sender {
    self.allStationsVC.stationType = TTStationTo;
    UIViewController *vc = self.view.window.rootViewController;
    [vc presentViewController:self.allStationsVC animated:YES completion:nil];
}

#pragma mark - TTSearchStationProtocol
- (void)setStation:(Station *)station forDirection:(TTStationType)stationType {
    if (stationType == TTStationFrom)
        self.stationFrom.text = station.stationTitle;
    else
        self.stationTo.text = station.stationTitle;
}


@end
