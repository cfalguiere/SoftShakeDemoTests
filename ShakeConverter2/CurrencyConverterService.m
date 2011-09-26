//
//  CurrencyConverterService.m
//  ShakeConverter2
//
//  Created by Claude FALGUIERE on 26/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CurrencyConverterService.h"


@implementation CurrencyConverterService

float kCHFRate = 1.2211f;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        
    }
    
    return self;
}

- (float)convert:(float)input {
    return input * kCHFRate;
}

- (NSString*)formatValue:(float)input {
    return [NSString stringWithFormat:@"%.4f", input];
}

- (float)parseValue:(NSString*)input {
    return [input floatValue];
}

@end
