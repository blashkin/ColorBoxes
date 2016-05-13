//
//  ColorBoxesTests.m
//  ColorBoxesTests
//
//  Created by Brusnikin on 12.05.16.
//  Copyright © 2016 Brusnikinapps. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BoxesViewController.h"

@interface ColorBoxesTests : XCTestCase

@property (nonatomic) BoxesViewController *boxes;

@end

@implementation ColorBoxesTests

- (void)setUp {
    [super setUp];
    
    self.boxes = [BoxesViewController new];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAddColors {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.boxes addColors:@[button]];
    [self.boxes addColors:nil];
}

- (void)testGetColors {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    [self.boxes getColors:0];
    [self.boxes getColors:-50];
    [self.boxes getColors:60];
    [self.boxes getColors:6];
    [self.boxes getColors:nil];
}


@end
