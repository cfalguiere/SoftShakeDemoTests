//
//  CurrencyConverterService.h
//  ShakeConverter2
//
//  Created by Claude FALGUIERE on 26/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CurrencyConverterService : NSObject

- (float)convert:(float)input;
- (NSString*)formatValue:(float)input;
- (float)parseValue:(NSString*)input;

@end
