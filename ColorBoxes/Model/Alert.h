//
//  Alert.h
//  ColorBoxes
//
//  Created by Brusnikin on 13.05.16.
//  Copyright © 2016 Brusnikinapps. All rights reserved.
//

@import UIKit;
@import Foundation;

BOOL isIos7();

@interface Alert : NSObject <UIAlertViewDelegate>

+ (instancetype)initWithTitle:(NSString *)title andMessage:(NSString *)message;
+ (instancetype)initWithSettingsAndTitle:(NSString *)title andMessage:(NSString *)message;

@end
