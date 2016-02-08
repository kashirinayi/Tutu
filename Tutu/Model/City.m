//
//  City.m
//  
//
//  Created by Artyom Ryzhkov on 06/02/16.
//
//

#import "City.h"

@implementation City

+ (City *)findCityById:(NSNumber *)Id {
    
    if (!Id)
        return nil;

    NSArray *cites = [City MR_findByAttribute:NSStringFromSelector(@selector(cityId)) withValue:Id];
    
    return (cites.count > 0) ? cites.firstObject : nil;
}

+ (City *)upsertCityFromDictionary :(NSDictionary *)dictionary {
    NSNumber *cityId = [dictionary valueForKey:NSStringFromSelector(@selector(cityId))];
    if (!cityId)
        return nil;
    
    City *city = [self findCityById:cityId];
    
    if (!city) {
        city = [City MR_createEntity];
        city.cityId = cityId;
    }
    
    [city updateCityFromDictionary:dictionary];
    
    return city;
}

- (void)updateCityFromDictionary:(NSDictionary *)dictionary {

    self.cityTitle = [dictionary valueForKey:NSStringFromSelector(@selector(cityTitle))];
    self.regionTitle = [dictionary valueForKey:NSStringFromSelector(@selector(regionTitle))];
    self.countryTitle = [dictionary valueForKey:NSStringFromSelector(@selector(countryTitle))];
    self.districtTitle = [dictionary valueForKey:NSStringFromSelector(@selector(dictionary))];
    
    NSArray *point = [dictionary valueForKey:@"point"];
    self.latitude = [point valueForKey:NSStringFromSelector(@selector(latitude))];
    self.longitude = [point valueForKey:NSStringFromSelector(@selector(longitude))];
    
    NSArray *stationsArr = [dictionary valueForKey:NSStringFromSelector(@selector(stations))];
    
    for (NSDictionary *stationDict in stationsArr) {
        Station *station = [Station upsertStationFromDictionary:stationDict];
        NSArray *cityStationsIds = [self.stations valueForKey:NSStringFromSelector(@selector(stationId))];
        if (![cityStationsIds containsObject:station.stationId])
            [self addStationsObject:station];
    }
    [[NSManagedObjectContext MR_defaultContext] MR_saveOnlySelfAndWait];
}

@end
