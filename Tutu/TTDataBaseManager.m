//
//  TTDataBaseManager.m
//  Tutu
//
//  Created by Artyom Ryzhkov on 06/02/16.
//  Copyright © 2016 Yulia Kashirina. All rights reserved.
//

#import "TTDataBaseManager.h"
#import "City+CoreDataProperties.h"
#import "Station+CoreDataProperties.h"

@implementation TTDataBaseManager

+ (void)initDataBase {
    if ([self isDataBaseInitialized])
        return;
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"allStations" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:plistPath];
    
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    if (![self isValidJSONObject:dictionary])
        return;
    
    NSDictionary *cityTypes = @{    @"citiesFrom":NSStringFromSelector(@selector(isCityFrom)),
                                    @"citiesTo":NSStringFromSelector(@selector(isCityTo))   };
    
    [cityTypes enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSArray *citiesOfType = [dictionary objectForKey:key];
        if (![self isValidJSONObject:citiesOfType])
            *stop = YES;
        
        for (NSDictionary *cityDict in citiesOfType) {
            if (![self isValidJSONObject:cityDict])
                *stop = YES;
            
            // если есть город с таким id, то обновляем его,
            // иначе создаем новую запись в БД
            City *city = [City upsertCityFromDictionary:cityDict];
            [city setValue:@YES forKey:obj];
            [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
        }
    }];
    
}

+ (BOOL)isValidJSONObject:(id)object {
    if (![NSJSONSerialization isValidJSONObject:object]) {
        NSLog(@"Ошибка в json файле");
        return NO;
    }
    return YES;
}

+ (BOOL)isDataBaseInitialized {
    if ([City MR_countOfEntities] > 0)
        return YES;
    
    return NO;
}

@end
