//
//  StartViewController.m
//  ColorBoxes
//
//  Created by Brusnikin on 12.05.16.
//  Copyright © 2016 Brusnikinapps. All rights reserved.
//

#import "StartViewController.h"
#import "ServerManager.h"
#import "LocationManager.h"
#import "Alert.h"

@interface StartViewController ()


@property (weak, nonatomic) IBOutlet UIButton *weatherButton;
@property (nonatomic) UIActivityIndicatorView *indicator;
@property (nonatomic) LocationManager *locationManager;

@end

@implementation StartViewController


#pragma mark - Controller lifecircle


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _locationManager = [LocationManager sharedManager];
    [_locationManager requestAuthorization];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Private API


- (IBAction)getLocalWeather:(UIButton *)sender
{
    [_locationManager stopUpdatingLocation];
    
    if (_locationManager.status != kCLAuthorizationStatusDenied &&
        _locationManager.status != kCLAuthorizationStatusRestricted)
    {
        [_indicator startAnimating];
        [self getForecast];
    }
    else
    {
        NSString *title = (_locationManager.status == kCLAuthorizationStatusDenied) ? @"Location services are off" : @"Location services is not enabled";
        NSString *message = @"You must turn on 'Always' or 'While using' in the Location Services Settings";
        [Alert initWithSettingsAndTitle:title andMessage:message];
    }
}

- (void)getForecast
{
    NSNumber *latitude = @([LocationManager sharedManager].locationManager.location.coordinate.latitude);
    NSNumber *longitude = @([LocationManager sharedManager].locationManager.location.coordinate.longitude);
    
    __block __weak typeof(self) blockSelf = self;
    [[ServerManager sharedManager]makeRequestWithParams:@{@"latitude" : latitude, @"longitude" : longitude} onSuccess:^(NSArray *forecast)
     {
         Weather *weather = forecast.firstObject;
         NSString *message = [NSString stringWithFormat:@"Day temperature: %@\n Night temperature: %@", weather.tempDay, weather.tempNight];
         [Alert initWithTitle:@"Forecast for today" andMessage:message];
         [blockSelf.indicator stopAnimating];
         
     } onFailure:^(NSError *error)
     {
         [Alert initWithTitle:@"Error" andMessage:error.localizedDescription];
         [blockSelf.indicator stopAnimating];
     }];
}

- (void)setWeatherButton:(UIButton *)weatherButton
{
    _indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    CGFloat halfButtonHeight = weatherButton.bounds.size.height / 2;
    CGFloat buttonWidth = weatherButton.bounds.size.width;
    _indicator.center = CGPointMake(buttonWidth - halfButtonHeight , halfButtonHeight);
    [weatherButton addSubview:_indicator];
}


@end
