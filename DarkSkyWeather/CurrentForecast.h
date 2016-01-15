//
//  CurrentForecast.h
//  DarkSkyWeather
//
//  Created by Michael O'Rourke on 1/14/16.
//  Copyright © 2016 Michael O'Rourke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CurrentForecast : NSObject


@property float currentTemp;
@property (strong, nonatomic) NSString *summary;

+(CurrentForecast *)currentForecastWithDictionary:(NSDictionary *)dictionary;
@end
