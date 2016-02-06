//
//  Station+CoreDataProperties.h
//  
//
//  Created by Artyom Ryzhkov on 06/02/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Station.h"

NS_ASSUME_NONNULL_BEGIN

@interface Station (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *stationId;
@property (nullable, nonatomic, retain) NSString *stationTitle;
@property (nullable, nonatomic, retain) City *city;

@end

NS_ASSUME_NONNULL_END
