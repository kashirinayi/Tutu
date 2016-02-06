//
//  City.h
//  
//
//  Created by Artyom Ryzhkov on 06/02/16.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface City : NSManagedObject

//+ (City *)findCityById:(NSString *)Id;
+ (City *)upsertCityFromDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END

#import "City+CoreDataProperties.h"
