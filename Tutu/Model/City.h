//
//  City.h
//  
//
//  Created by Artyom Ryzhkov on 06/02/16.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Station;

NS_ASSUME_NONNULL_BEGIN

@interface City : NSManagedObject

+ (City *)upsertCityFromDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END

#import "City+CoreDataProperties.h"
