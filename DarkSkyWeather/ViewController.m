//
//  ViewController.m
//  DarkSkyWeather
//
//  Created by Michael O'Rourke on 12/15/15.
//  Copyright © 2015 Michael O'Rourke. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "WeeklyForecast.h"
#import "ForecastTableViewCell.h"
#import "APIManager.h"
#import "CurrentForecast.h"
#import "DetailForecastViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate>

@property (nonatomic, strong) NSDictionary *forecastData;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property float lat;
@property float lon;
@property float currentTemp;
@property (strong, nonatomic) NSString *summary;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *weeklyForecast;
@property (strong, nonatomic) NSArray *daysOfTheWeek;
@property NSUserDefaults *defaults;
@property (strong, nonatomic) CurrentForecast *currentForecast;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self getCurrentCoordinates];
    
    
    [APIManager getWeatherData:_lat andLon:_lon completionHandler:^(Status status, NSArray *weeklyForecast, CurrentForecast *current) {
        
        self.weeklyForecast = weeklyForecast;
        self.currentForecast = current;
        
        [self.tableView reloadData];
    }];
    [self getFutureForecastStrings];
    
    
    
    
}

#pragma mark TableView Delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ForecastTableViewCell *cell = [ForecastTableViewCell new];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    WeeklyForecast *forecast = self.weeklyForecast[indexPath.row];
    
    if (indexPath.row == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"Current"];
        cell.tempLabel.text = [NSString stringWithFormat:@"%.0f%@", self.currentForecast.currentTemp, @"\u00B0"];
        cell.summaryLabel.text = self.currentForecast.summary;
        
    } else  {
        
        cell = [tableView dequeueReusableCellWithIdentifier:@"Weekly"];
        WeeklyForecast *forecast = self.weeklyForecast[indexPath.row];
        cell.forecastLabel.text = [NSString stringWithFormat:@"%@ - %.0f %.0f", [self.daysOfTheWeek objectAtIndex:indexPath.row - 1], forecast.maxTemp, forecast.minTemp];

    
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 300;
    } else {
        
        return 44;
    }
    
}

#pragma mark Setup

-(void)getCurrentCoordinates {
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    
    
    self.lat = self.locationManager.location.coordinate.latitude;
    self.lon = self.locationManager.location.coordinate.longitude;
    
}



-(void)getFutureForecastStrings {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    
    NSDate *now = [NSDate date];
    
    NSMutableArray *results = [NSMutableArray new];
    
    for (int i = 0; i < 6; i++)
    {
        NSDate *date = [NSDate dateWithTimeInterval:(i * (60 * 60 * 24)) sinceDate:now];
        [results addObject:[dateFormatter stringFromDate:date]];
    }
    
    [results removeObjectAtIndex:0];
    
    self.daysOfTheWeek = results;
    
    
}

#pragma mark navigation
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"DayOfWeekSegue"]) {
        
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        WeeklyForecast *selectedDayOfWeek = [self.weeklyForecast objectAtIndex:indexPath.row];
        
        ((DetailForecastViewController*)segue.destinationViewController).dayOfWeekForecast = selectedDayOfWeek;
        
    } 
}

@end
