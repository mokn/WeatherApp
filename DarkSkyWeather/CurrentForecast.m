//
//  CurrentForecast.m
//  DarkSkyWeather
//
//  Created by Michael O'Rourke on 1/14/16.
//  Copyright © 2016 Michael O'Rourke. All rights reserved.
//

#import "CurrentForecast.h"

@implementation CurrentForecast

+(CurrentForecast *)currentForecastWithDictionary:(NSDictionary *)dictionary {
    
    CurrentForecast *currentForecast = [CurrentForecast new];
    
    currentForecast.currentTemp = [[dictionary objectForKey:@"temperature"] floatValue];
    currentForecast.summary = [dictionary objectForKey:@"summary"];
    
    return currentForecast;
    
}

@end
