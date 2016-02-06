//
//  Station.m
//  
//
//  Created by Artyom Ryzhkov on 06/02/16.
//
//

#import "Station.h"
#import "City.h"

@implementation Station

+ (Station *)findStationById:(NSNumber *)Id {
    
    if (!Id)
        return nil;
    
    NSArray *stations = [Station MR_findByAttribute:NSStringFromSelector(@selector(stationId)) withValue:Id];
    
    return (stations.count > 0) ? stations.firstObject : nil;
}

+ (Station *)upsertStationFromDictionary:(NSDictionary *)dictionary {
    NSNumber *stationId = [dictionary valueForKey:NSStringFromSelector(@selector(stationId))];
    if (!stationId)
        return nil;
    
    Station *station = [self findStationById:stationId];
    
    if (!station) {
        station = [Station MR_createEntity];
        station.stationId = stationId;
    }
    
    [station updateStationFromDictionary:dictionary];
    
    return station;
}

- (void)updateStationFromDictionary:(NSDictionary *)dictionary {
    
    self.stationTitle = [dictionary valueForKey:NSStringFromSelector(@selector(stationTitle))];
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveOnlySelfAndWait];
}


@end
