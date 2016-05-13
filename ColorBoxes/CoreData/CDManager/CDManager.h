//
//  CDManager.h
//  ColorBoxes
//
//  Created by Brusnikin on 12.05.16.
//  Copyright © 2016 Brusnikinapps. All rights reserved.
//

@import Foundation;
@import CoreData;

@interface CDManager : NSObject

+ (CDManager *)sharedManager;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
