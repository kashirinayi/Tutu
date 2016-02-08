//
//  TTAllStationsViewController.m
//  Tutu
//
//  Created by Artyom Ryzhkov on 07/02/16.
//  Copyright © 2016 Yulia Kashirina. All rights reserved.
//

#import "TTAllStationsViewController.h"
#import "TTStationViewController.h"
#import "City+CoreDataProperties.h"
#import "Station+CoreDataProperties.h"

#define TTAllStationsTableViewCell @"TTAllStationsTableViewCell"

@interface TTAllStationsViewController ()
<   UITableViewDataSource,
    UITableViewDelegate,
    UISearchResultsUpdating,
    UISearchBarDelegate    >

@property (strong, nonatomic) NSArray *filteredStations;

@property (strong, nonatomic) UISearchController *searchController;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TTAllStationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.dimsBackgroundDuringPresentation = NO;
    self.searchController.searchBar.delegate = self;
    
    self.tableView.tableHeaderView = self.searchController.searchBar;
    
    [self initWithAllStations];
}

- (void)initWithAllStations {
    NSPredicate *predicate = [Station predicateForCityType:self.stationType];
    self.filteredStations = [Station MR_findAllSortedBy:NSStringFromSelector(@selector(stationTitle)) ascending:YES withPredicate:predicate];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.filteredStations.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TTAllStationsTableViewCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TTAllStationsTableViewCell];
    }
    
    Station *station = self.filteredStations[indexPath.row];
    cell.textLabel.text = station.stationTitle;
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self.delegate setStation:self.filteredStations[indexPath.row] forDirection:self.stationType];
    
    [self cancelButtonPressed:nil];
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TTStationViewController *vc = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass(TTStationViewController.class)];
    vc.station = self.filteredStations[indexPath.row];
    
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - UISearchResultsUpdating

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
    NSString *searchString = searchController.searchBar.text;
    [self searchForText:searchString];
    
    [self.tableView reloadData];
}

- (void)searchForText:(NSString *)searchText {
    
    if ([searchText isEqualToString:@""]) {
        [self initWithAllStations];
        return;
    }
    
    NSPredicate *cityPredicate = [Station predicateForCityType:self.stationType];
    NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"%K contains[cd] %@", NSStringFromSelector(@selector(stationTitle)), searchText];
    NSPredicate *predicate = [NSCompoundPredicate andPredicateWithSubpredicates:@[cityPredicate, searchPredicate]];
    
    self.filteredStations = [Station MR_findAllSortedBy:NSStringFromSelector(@selector(stationTitle)) ascending:YES withPredicate:predicate];
}

- (IBAction)cancelButtonPressed:(id)sender {
    self.searchController.active = NO;
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
