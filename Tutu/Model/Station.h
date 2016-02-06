//
//  Station.h
//  
//
//  Created by Artyom Ryzhkov on 06/02/16.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class City;

NS_ASSUME_NONNULL_BEGIN

@interface Station : NSManagedObject

+ (Station *)upsertStationFromDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END

#import "Station+CoreDataProperties.h"
