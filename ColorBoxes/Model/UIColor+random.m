//
//  UIColor+random.m
//  ColorBoxes
//
//  Created by Brusnikin on 13.05.16.
//  Copyright © 2016 Brusnikinapps. All rights reserved.
//

#import "UIColor+random.h"

@implementation UIColor (random)

+ (UIColor *)randomColor
{
    //CGFloat red = (arc4random()%256/256.0);
    //CGFloat green = (arc4random()%256/256.0);
    //CGFloat blue = (arc4random()%256/256.0);
    
    return [UIColor colorWithRed:self.red green:self.green blue:self.blue alpha:1.0];
}

+ (CGFloat)red
{
    return self.random;
}

+ (CGFloat)green
{
    return self.random;
}

+ (CGFloat)blue
{
    return self.random;
}

+ (CGFloat)random
{
    return arc4random()%256/256.0;
}

@end
