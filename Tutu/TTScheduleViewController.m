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
@property (weak, nonatomic) IBOutlet UITextField *dateTextField;
@property (strong, nonatomic) UIDatePicker *datePicker;


@end

@implementation TTScheduleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.allStationsVC = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass(TTAllStationsViewController.class)];
    
    self.datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.dateTextField.frame), CGRectGetWidth(self.view.frame), 150)];
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    self.datePicker.minimumDate = [NSDate date];
    self.dateTextField.inputView = self.datePicker;
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 44)];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Готово" style:UIBarButtonItemStyleDone target:self action:@selector(saveDate:)];
    toolbar.items = @[doneButton];
    self.dateTextField.inputAccessoryView = toolbar;
}

- (void)saveDate:(id)sender {
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"dd.MM.yyyy";
    self.dateTextField.text = [dateFormatter stringFromDate:self.datePicker.date];
    
    [self.dateTextField resignFirstResponder];
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
