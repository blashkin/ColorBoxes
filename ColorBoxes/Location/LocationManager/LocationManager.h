//
//  LocationManager.h
//  ColorBoxes
//
//  Created by Brusnikin on 13.05.16.
//  Copyright © 2016 Brusnikinapps. All rights reserved.
//

@import UIKit;
@import Foundation;
@import CoreLocation;


@interface LocationManager : NSObject <CLLocationManagerDelegate>

@property (nonatomic) CLLocationManager *locationManager;
@property (assign, nonatomic) CLAuthorizationStatus status;

+ (instancetype)sharedManager;
- (void)requestAuthorization;
- (void)stopUpdatingLocation;

@end
