//
//  APIManager.h
//  DarkSkyWeather
//
//  Created by Michael O'Rourke on 1/14/16.
//  Copyright © 2016 Michael O'Rourke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CurrentForecast.h"

@interface APIManager : NSObject

typedef enum {
    Success,
    Error
}Status;

+(void)getWeatherData:(float)lat andLon:(float)lon completionHandler:(void(^)(Status, NSArray *, CurrentForecast *))handler;

@end
