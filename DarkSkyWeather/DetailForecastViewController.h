//
//  DetailForecastViewController.h
//  DarkSkyWeather
//
//  Created by Michael O'Rourke on 1/14/16.
//  Copyright © 2016 Michael O'Rourke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeeklyForecast.h"

@interface DetailForecastViewController : UIViewController

@property (strong, nonatomic) WeeklyForecast *dayOfWeekForecast;

@end
