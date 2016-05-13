//
//  Weather.h
//  ColorBoxes
//
//  Created by Brusnikin on 12.05.16.
//  Copyright © 2016 Brusnikinapps. All rights reserved.
//

@import Foundation;

@interface Weather : NSObject

- (instancetype)initWithJSON:(NSDictionary *)JSON;

@property (nonatomic) NSString *cityArea;
@property (nonatomic) NSNumber *latitude;
@property (nonatomic) NSNumber *longitude;
@property (nonatomic) NSString *tempDay;
@property (nonatomic) NSString *tempNight;

@end
