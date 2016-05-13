//
//  LocationManager.m
//  ColorBoxes
//
//  Created by Brusnikin on 13.05.16.
//  Copyright © 2016 Brusnikinapps. All rights reserved.
//

#import "LocationManager.h"
#import "Alert.h"

@interface LocationManager() <UIAlertViewDelegate>

@property (nonatomic) NSURL *settingsURL;

@end

@implementation LocationManager


+ (instancetype)sharedManager
{
    static LocationManager *locationManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        locationManager = [LocationManager new];
    });
    
    return locationManager;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _locationManager = [CLLocationManager new];
        _locationManager.delegate = self;
        _locationManager.distanceFilter = kCLDistanceFilterNone;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        _locationManager.activityType = CLActivityTypeFitness;
        _locationManager.pausesLocationUpdatesAutomatically = YES;
    }
    return self;
}


#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    [Alert initWithTitle:@"Error" andMessage:error.localizedDescription];
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    switch (status)
    {
        case kCLAuthorizationStatusNotDetermined:
            _status = kCLAuthorizationStatusNotDetermined;
            break;
        case kCLAuthorizationStatusDenied:
            _status = kCLAuthorizationStatusDenied;
            break;
        case kCLAuthorizationStatusAuthorizedAlways:
            _status = kCLAuthorizationStatusAuthorizedAlways;
            break;
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            _status = kCLAuthorizationStatusAuthorizedWhenInUse;
            break;
        default:
            break;
    }
}

- (void)requestAuthorization
{
    _status = [CLLocationManager authorizationStatus];
    
    // If the status is denied, display an alert
    if (_status == kCLAuthorizationStatusDenied ||
        _status == kCLAuthorizationStatusRestricted)
    {
        NSString *title = (_status == kCLAuthorizationStatusDenied) ? @"Location services are off" : @"Location services is not enabled";
        NSString *message = @"You must turn on 'Always' or 'While using' in the Location Services Settings";
        [Alert initWithSettingsAndTitle:title andMessage:message];
    }
    else
    {
        if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])
        {
            [self.locationManager requestWhenInUseAuthorization];
        }

        [self.locationManager requestLocation];

        [self startUpdatingLocation];
    }
}

- (void)startUpdatingLocation
{
    [_locationManager startUpdatingLocation];
}

- (void)stopUpdatingLocation
{
    [_locationManager stopUpdatingLocation];
}

- (NSURL *)settingsURL
{
    if (!_settingsURL)
    {
        _settingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    }
    
    return _settingsURL;
}


@end
