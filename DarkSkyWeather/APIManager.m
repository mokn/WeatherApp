//
//  APIManager.m
//  DarkSkyWeather
//
//  Created by Michael O'Rourke on 1/14/16.
//  Copyright © 2016 Michael O'Rourke. All rights reserved.
//

#import "APIManager.h"
#import <AFNetworking.h>
#import "WeeklyForecast.h"
#import "CurrentForecast.h"

@implementation APIManager

+(void)getWeatherData:(float)lat andLon:(float)lon completionHandler:(void(^)(Status, NSArray *, CurrentForecast *))handler{
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:config];
    
    NSDictionary *forecastData = [[NSDictionary alloc] init];
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.forecast.io/forecast/69a836f93d3c8935a7f5a1f8fd836b50/%ld,%ld", (long)lat, (long)lon];
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *task = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        CurrentForecast *currentForecast = [CurrentForecast new];
        currentForecast = [CurrentForecast currentForecastWithDictionary:[responseObject objectForKey:@"currently"]];
        
        NSMutableArray *tempArray = [NSMutableArray new];
        
        for (NSDictionary *day in [[responseObject objectForKey:@"daily"] objectForKey:@"data"]) {
            
                            [tempArray addObject:[WeeklyForecast weeklyForecastWithDictionary:day]];
            
                        }
        
                        handler(Success, tempArray, currentForecast);
        
    }];
    
    [task resume];
    
//    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        
//        NSMutableArray *tempArray = [NSMutableArray new];
//        
//        data = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
//        
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            
////            self.currentTemp = [[[self.forecastData objectForKey:@"currently"] objectForKey:@"temperature"] floatValue];
////            self.summary = [[self.forecastData objectForKey:@"currently"] objectForKey:@"summary"];
//            
////            for (NSDictionary *day in [[self.forecastData objectForKey:@"daily"] objectForKey:@"data"]) {
////                
////                [tempArray addObject:[WeeklyForecast weeklyForecastWithDictionary:day]];
////                
////            }
////            self.weeklyForecast = tempArray;
//            
//            
//            
//        });
//    }];
//    [downloadTask resume];
    
}


@end
