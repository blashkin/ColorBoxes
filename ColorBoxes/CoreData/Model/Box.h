//
//  Box.h
//  ColorBoxes
//
//  Created by Brusnikin on 12.05.16.
//  Copyright © 2016 Brusnikinapps. All rights reserved.
//

@import UIKit;
@import Foundation;
@import CoreData;

NS_ASSUME_NONNULL_BEGIN

@interface Box : NSManagedObject

+ (Box *)boxWithDataColor:(NSData *)dataColor;
+ (void)addBox:(Box *)box withDataColor:(NSData *)dataColor;
+ (NSArray *)boxes;

@end

NS_ASSUME_NONNULL_END

#import "Box+CoreDataProperties.h"
