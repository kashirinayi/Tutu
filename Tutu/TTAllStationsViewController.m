//
//  TTAllStationsViewController.m
//  Tutu
//
//  Created by Artyom Ryzhkov on 07/02/16.
//  Copyright © 2016 Yulia Kashirina. All rights reserved.
//

#import "TTAllStationsViewController.h"
#import "TTAllStationsTableViewCell.h"
#import "City+CoreDataProperties.h"
#import "Station+CoreDataProperties.h"

@interface TTAllStationsViewController ()
<   UITableViewDataSource,
    UITableViewDelegate,
    UISearchResultsUpdating,
    UISearchBarDelegate    >

@property (strong, nonatomic) NSArray *cities;

@property (strong, nonatomic) UISearchController *searchController;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TTAllStationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.dimsBackgroundDuringPresentation = NO;
    self.searchController.searchBar.scopeButtonTitles = @[NSLocalizedString(@"ScopeButtonCountry",@"Country"),
                                                          NSLocalizedString(@"ScopeButtonCapital",@"Capital")];
    self.searchController.searchBar.delegate = self;
    
    self.tableView.tableHeaderView = self.searchController.searchBar;
    self.definesPresentationContext = YES;
    [self.searchController.searchBar sizeToFit];
    
    if (self.stationType == TTStationFrom) {
        self.cities = [City MR_findByAttribute:NSStringFromSelector(@selector(isCityFrom)) withValue:@YES];
    }
    else {
        self.cities = [City MR_findByAttribute:NSStringFromSelector(@selector(isCityTo)) withValue:@YES];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.cities.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    City *city = self.cities[section];
    return city.stations.count;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    City *city = self.cities[section];
    return [NSString stringWithFormat:@"%@, %@", city.countryTitle, city.cityTitle];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(TTAllStationsTableViewCell.class)];
    if (!cell) {
        cell = [[TTAllStationsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(TTAllStationsTableViewCell.class)];
    }
    
    City *city = self.cities[indexPath.section];
    Station *station = city.orderedStations[indexPath.row];
    cell.textLabel.text = station.stationTitle;
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


#pragma mark - UISearchResultsUpdating

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    NSString *searchString = searchController.searchBar.text;
//    [self searchForText:searchString scope:searchController.searchBar.selectedScopeButtonIndex];
    [self.tableView reloadData];
}

- (IBAction)cancelButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
