//
//  City+CoreDataProperties.h
//  Tutu
//
//  Created by Artyom Ryzhkov on 06/02/16.
//  Copyright © 2016 Yulia Kashirina. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "City.h"
#import "Station.h"

NS_ASSUME_NONNULL_BEGIN

@interface City (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *countryTitle;
@property (nullable, nonatomic, retain) NSNumber *longitude;
@property (nullable, nonatomic, retain) NSNumber *latitude;
@property (nullable, nonatomic, retain) NSString *districtTitle;
@property (nullable, nonatomic, retain) NSNumber *cityId;
@property (nullable, nonatomic, retain) NSString *cityTitle;
@property (nullable, nonatomic, retain) NSString *regionTitle;
@property (nullable, nonatomic, retain) NSNumber *isCityFrom;
@property (nullable, nonatomic, retain) NSNumber *isCityTo;
@property (nullable, nonatomic, retain) NSSet<Station *> *stations;

@end

@interface City (CoreDataGeneratedAccessors)

- (void)addStationsObject:(Station *)value;
- (void)removeStationsObject:(Station *)value;
- (void)addStations:(NSSet<Station *> *)values;
- (void)removeStations:(NSSet<Station *> *)values;

@end

NS_ASSUME_NONNULL_END
