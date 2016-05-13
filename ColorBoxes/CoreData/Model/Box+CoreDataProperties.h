//
//  Box+CoreDataProperties.h
//  ColorBoxes
//
//  Created by Brusnikin on 13.05.16.
//  Copyright © 2016 Brusnikinapps. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Box.h"

NS_ASSUME_NONNULL_BEGIN

@interface Box (CoreDataProperties)

@property (nullable, nonatomic, retain) NSData *color;

@end

NS_ASSUME_NONNULL_END
