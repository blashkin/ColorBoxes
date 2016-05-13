//
//  Alert.m
//  ColorBoxes
//
//  Created by Brusnikin on 13.05.16.
//  Copyright © 2016 Brusnikinapps. All rights reserved.
//

#import "Alert.h"

@interface Alert()

@property (nonatomic) NSURL *settingsURL;
@property (nonatomic) UIWindow *alertWindow;
@end

BOOL isIos7()
{
    return [[UIDevice currentDevice].systemVersion hasPrefix:@"7"];
}

@implementation Alert

+ (instancetype)initWithTitle:(NSString *)title andMessage:(NSString *)message
{
    Alert *alert = [Alert new];
    
    if (isIos7())
    {
        [[[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil]show];
    }
    else
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
        
        [alert.alertWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
    }
    
    return alert;
}


+ (instancetype)initWithSettingsAndTitle:(NSString *)title andMessage:(NSString *)message
{
    Alert *alert = [Alert new];
    
    if (isIos7())
    {
        [[[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Settings", nil]show];
    }
    else
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *settings = [UIAlertAction actionWithTitle:@"Settings" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
                                   {
                                       // Send the user to the Settings for this app
                                       [[UIApplication sharedApplication] openURL:alert.settingsURL];
                                   }];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
        [alertController addAction:settings];
        
        [alert.alertWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
    }
    
    return alert;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        // Send the user to the Settings for this app
        [[UIApplication sharedApplication] openURL:self.settingsURL];
    }
}

- (NSURL *)settingsURL
{
    if (!_settingsURL)
    {
        _settingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    }
    
    return _settingsURL;
}

- (UIWindow *)alertWindow
{
    if (!_alertWindow)
    {
        _alertWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _alertWindow.rootViewController = [UIViewController new];
        _alertWindow.windowLevel = UIWindowLevelAlert + 1;
        [_alertWindow makeKeyAndVisible];
    }
    
    return _alertWindow;
}


@end
