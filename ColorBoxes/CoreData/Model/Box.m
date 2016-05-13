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
    NSManagedObjectContext *context = [CDManager sharedManager].managedObjectContext;
    Box *box = [NSEntityDescription insertNewObjectForEntityForName:@"Box" inManagedObjectContext:context];
    box.color = dataColor;
    
    [box saveInContext:context];
    
    return box;
}

+ (void)addBox:(Box *)box withDataColor:(NSData *)dataColor
{
    NSManagedObjectContext *context = [CDManager sharedManager].managedObjectContext;
    box.color = dataColor;
    
    [box saveInContext:context];
}

+ (NSArray *)boxes
{
    NSError *error = nil;
    NSManagedObjectContext *context = [CDManager sharedManager].managedObjectContext;
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Box"];
    return [context executeFetchRequest:request error:&error];
}

- (void)saveInContext:(NSManagedObjectContext *)context
{
    NSError *error = nil;
    if (![context save:&error])
    {
        NSLog(@"error: %@", error.localizedDescription);
    }
}

@end
