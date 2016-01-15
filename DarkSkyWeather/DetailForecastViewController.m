//
//  DetailForecastViewController.m
//  DarkSkyWeather
//
//  Created by Michael O'Rourke on 1/14/16.
//  Copyright © 2016 Michael O'Rourke. All rights reserved.
//

#import "DetailForecastViewController.h"

@interface DetailForecastViewController ()
@property (weak, nonatomic) IBOutlet UILabel *highTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *lowTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;
@property (weak, nonatomic) IBOutlet UILabel *precipLabel;

@end

@implementation DetailForecastViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.highTempLabel.text = [NSString stringWithFormat:@"HI - %.0f", self.dayOfWeekForecast.maxTemp];
    self.lowTempLabel.text = [NSString stringWithFormat:@"LOW - %.0f", self.dayOfWeekForecast.minTemp];
    self.summaryLabel.text = self.dayOfWeekForecast.summary;
    self.precipLabel.text = [NSString stringWithFormat:@"%@ chance of precipitation.", self.dayOfWeekForecast.precipProbability];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backButtonPressed:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
