//
//  TTMainViewController.m
//  Tutu
//
//  Created by Artyom Ryzhkov on 06/02/16.
//  Copyright © 2016 Yulia Kashirina. All rights reserved.
//

#import "TTMainViewController.h"
#import "TTScheduleViewController.h"
#import "TTAboutViewController.h"

@interface TTMainViewController ()

@property (strong, nonatomic) TTScheduleViewController *scheduleVC;
@property (strong, nonatomic) TTAboutViewController *aboutVC;

@end

@implementation TTMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addScheduleVC];
    [self addAboutVC];
}

- (void)addScheduleVC {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.scheduleVC = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass(TTScheduleViewController.class)];
    [self.view addSubview:self.scheduleVC.view];
}

- (void)addAboutVC {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.aboutVC = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass(TTAboutViewController.class)];
    self.aboutVC.view.hidden = YES;
    [self.view addSubview:self.aboutVC.view];
}

- (IBAction)segmentControlChanged:(id)sender {
    
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    
    if (selectedSegment == 0) {
        self.scheduleVC.view.hidden = NO;
        self.aboutVC.view.hidden = YES;
    }
    else {
        self.scheduleVC.view.hidden = YES;
        self.aboutVC.view.hidden = NO;
    }
}

@end
