//
//  Box.m
//  ColorBoxes
//
//  Created by Brusnikin on 12.05.16.
//  Copyright © 2016 Brusnikinapps. All rights reserved.
//

#import "Box.h"
#import "UIColor+random.h"
#import "CDManager.h"

@implementation Box

+ (Box *)boxWithDataColor:(NSData *)dataColor
{
    NSError *error = nil;
    NSManagedObjectContext *context = [CDManager sharedManager].managedObjectContext;
    Box *box = [NSEntityDescription insertNewObjectForEntityForName:@"Box" inManagedObjectContext:context];
    box.color = dataColor;
    
    if (![context save:&error])
    {
        NSLog(@"error: %@", error.localizedDescription);
    }
    return box;
}

+ (void)addBox:(Box *)box withDataColor:(NSData *)dataColor
{
    NSError *error = nil;
    NSManagedObjectContext *context = [CDManager sharedManager].managedObjectContext;
    box.color = dataColor;
    
    if (![context save:&error])
    {
        NSLog(@"error: %@", error.localizedDescription);
    }
}

+ (NSArray *)boxes
{
    NSError *error = nil;
    NSManagedObjectContext *context = [CDManager sharedManager].managedObjectContext;
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Box"];
    return [context executeFetchRequest:request error:&error];
}

/*
 + (Box *)boxWithDataColor:(NSData *)dataColor
 {
 NSError *error = nil;
 NSManagedObjectContext *context = [CDManager sharedManager].managedObjectContext;
 Box *box = nil;
 
 
 NSArray *results = [Box boxes];
 
 if (error || !results)
 {
 NSLog(@"error: %@", error.localizedDescription);
 }
 else if (results.firstObject)
 {
 box = results.firstObject;
 }
 else
 {
 box = [NSEntityDescription insertNewObjectForEntityForName:@"Box" inManagedObjectContext:context];
 box.color = dataColor;
 }
 
 if (![context save:&error])
 {
 NSLog(@"error: %@", error.localizedDescription);
 }
 return box;
 }

*/


@end
