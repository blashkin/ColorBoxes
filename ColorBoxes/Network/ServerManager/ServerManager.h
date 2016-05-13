//
//  ServerManager.h
//  ColorBoxes
//
//  Created by Brusnikin on 12.05.16.
//  Copyright © 2016 Brusnikinapps. All rights reserved.
//

@import Foundation;

#import "Weather.h"

@interface ServerManager : NSObject

+ (ServerManager *)sharedManager;

- (void)makeRequestWithParams:(NSDictionary *)params
                    onSuccess:(void (^)(NSArray *forecast))success
                    onFailure:(void (^)(NSError *error))failure;

@end
