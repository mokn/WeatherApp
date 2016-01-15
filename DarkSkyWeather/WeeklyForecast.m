//
//  WeeklyForecast.m
//  DarkSkyWeather
//
//  Created by Michael O'Rourke on 12/15/15.
//  Copyright © 2015 Michael O'Rourke. All rights reserved.
//

#import "WeeklyForecast.h"

@implementation WeeklyForecast

+(WeeklyForecast *)weeklyForecastWithDictionary:(NSDictionary *)dictionary {
    
    WeeklyForecast *weeklyForecast = [WeeklyForecast new];
    
    weeklyForecast.minTemp = [[dictionary objectForKey:@"temperatureMin"] floatValue];
    weeklyForecast.maxTemp = [[dictionary objectForKey:@"temperatureMax"] floatValue];
    weeklyForecast.precipProbability = [dictionary objectForKey:@"precipProbability"];
    weeklyForecast.summary = [dictionary objectForKey:@"summary"];
    
    
    return weeklyForecast;
}


@end
