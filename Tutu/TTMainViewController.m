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
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;

@end

@implementation TTMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scheduleVC = (TTScheduleViewController *)[self addViewController:TTScheduleViewController.class];
    self.aboutVC = (TTAboutViewController *)[self addViewController:TTAboutViewController.class];
    self.aboutVC.view.hidden = YES;
}

- (UIViewController *)addViewController:(Class)vcClass {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass(vcClass)];
    [self.view addSubview:vc.view];
    
    [vc.view makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.toolbar.mas_bottom);
        make.leading.equalTo(self.view.mas_leading);
        make.trailing.equalTo(self.view.mas_trailing);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    
    return vc;
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
