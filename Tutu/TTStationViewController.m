//
//  TTStationViewController.m
//  Tutu
//
//  Created by Artyom Ryzhkov on 09/02/16.
//  Copyright © 2016 Yulia Kashirina. All rights reserved.
//

#import "TTStationViewController.h"
#import "Station+CoreDataProperties.h"
#import "City+CoreDataProperties.h"

#define TTStationTableViewCell @"TTStationTableViewCell"

@interface TTStationViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TTStationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TTStationTableViewCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:TTStationTableViewCell];
    }
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Cтанция:";
            cell.detailTextLabel.text = self.station.stationTitle;
            break;
        case 1:
            cell.textLabel.text = @"Город:";
            cell.detailTextLabel.text = self.station.city.cityTitle;
            break;
        case 2:
            cell.textLabel.text = @"Регион:";
            cell.detailTextLabel.text = self.station.city.regionTitle;
            break;
        case 3:
            cell.textLabel.text = @"Страна:";
            cell.detailTextLabel.text = self.station.city.countryTitle;
            break;
            
        default:
            break;
    }
    
    return cell;
}

- (IBAction)cancelButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
