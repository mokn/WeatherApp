//
//  WeeklyForecast.h
//  DarkSkyWeather
//
//  Created by Michael O'Rourke on 12/15/15.
//  Copyright © 2015 Michael O'Rourke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeeklyForecast : NSObject

@property float maxTemp;
@property float minTemp;
@property (strong, nonatomic) NSString *summary;
@property (strong,nonatomic) NSString *precipProbability;

+(WeeklyForecast *)weeklyForecastWithDictionary:(NSDictionary *)dictionary;

@end
