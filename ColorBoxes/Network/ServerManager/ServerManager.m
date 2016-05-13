//
//  ServerManager.m
//  ColorBoxes
//
//  Created by Brusnikin on 12.05.16.
//  Copyright © 2016 Brusnikinapps. All rights reserved.
//

#import "ServerManager.h"

static NSString *kAPI = @"19c8f92ebcd498cc72801c4ba799409f";

@interface ServerManager ()

@property (nonatomic) NSURLSession *session;

@end

@implementation ServerManager

+ (ServerManager *)sharedManager
{
    static ServerManager *manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [ServerManager new];
    });
    
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:configuration];
    }
    return self;
}


#pragma mark - ServerManagerRequests


- (void)makeRequestWithParams:(NSDictionary *)params
                    onSuccess:(void (^)(NSArray *forecast))success
                    onFailure:(void (^)(NSError *error))failure
{
    NSString *baseURL = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/forecast/daily?cnt=1&lang=ru&units=metric&"];
    NSString *coordinate = [NSString stringWithFormat:@"lat=%@&lon=%@&appid=%@", params[@"latitude"], params[@"longitude"], kAPI];
    NSString *URLString = [baseURL stringByAppendingString:coordinate];
    NSURL *url = [NSURL URLWithString:URLString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:30.0];
    [[_session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
     {
         if (error)
         {
             failure(error);
         }
         else
         {
             NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
             Weather *weather = [[Weather alloc]initWithJSON:json];
             NSArray *array = @[weather];
             
             dispatch_async(dispatch_get_main_queue(), ^{
                 success(array);
             });
         }
    }]resume];
}


@end
