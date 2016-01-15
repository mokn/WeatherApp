//
//  ForecastTableViewCell.h
//  DarkSkyWeather
//
//  Created by Michael O'Rourke on 12/15/15.
//  Copyright © 2015 Michael O'Rourke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForecastTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *forecastLabel;
@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayOfTheWeekLabel;

@end
