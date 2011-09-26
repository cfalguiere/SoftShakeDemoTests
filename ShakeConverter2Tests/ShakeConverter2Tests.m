//
//  ShakeConverter2Tests.m
//  ShakeConverter2Tests
//
//  Created by Claude FALGUIERE on 26/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ShakeConverter2Tests.h"
#import "CurrencyConverterService.h"

@implementation ShakeConverter2Tests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}
 
- (void)testConvert
{
    CurrencyConverterService *converter = [[CurrencyConverterService alloc] init];
    float input = 10.0f; // euro
    float output = [converter convert:input];
    STAssertEqualsWithAccuracy(output, 12.211f, 3, nil);
    converter = nil;
}

- (void)testFormatValue 
{
    CurrencyConverterService *converter = [[CurrencyConverterService alloc] init];
    float n = 1.2211f;
    NSString *s = [converter formatValue:n];
    STAssertEqualObjects(s, @"1.2211", nil);
    converter = nil;
}

- (void)testParseValue
{
    CurrencyConverterService *converter = [[CurrencyConverterService alloc] init];
    NSString *s = @"3.4";
    float n = [converter parseValue:s];
    STAssertEquals(n, 3.4f, nil);
    converter = nil;
    
}
@end
