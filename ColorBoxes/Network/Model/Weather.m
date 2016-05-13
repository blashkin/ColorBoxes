//
//  Weather.m
//  ColorBoxes
//
//  Created by Brusnikin on 12.05.16.
//  Copyright © 2016 Brusnikinapps. All rights reserved.
//

#import "Weather.h"

@implementation Weather

- (instancetype)initWithJSON:(NSDictionary *)JSON
{
    self = [super init];
    if (self)
    {
        NSDictionary *list = [JSON[@"list"] firstObject];
        NSDictionary *temp = list[@"temp"];

        _tempDay = [self degreeSign:temp[@"day"]];
        _tempNight = [self degreeSign:temp[@"night"]];
        
        NSDictionary *coord = JSON[@"city"][@"coord"];
        _latitude = coord[@"lat"];
        _longitude = coord[@"lon"];
        
        _cityArea = JSON[@"city"][@"name"];
    }
    return self;
}

- (NSString *)degreeSign:(NSNumber*)temp
{
    double value = [temp doubleValue];
    
    value < 0.0 && value > -0.5 ? value *= -1 : value;
    return [NSString stringWithFormat:@"%.0f°", value ];
}

@end
