//
//  ShakeConverter2ViewController.m
//  ShakeConverter2
//
//  Created by Claude FALGUIERE on 26/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ShakeConverter2ViewController.h"
#import "CurrencyConverterService.h"

@implementation ShakeConverter2ViewController

@synthesize outputValue, inputValue;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark - selectors 

- (IBAction)handleGoButton:(id)sender {
    CurrencyConverterService *converter = [[CurrencyConverterService alloc] init];
    float sourceValue = [converter parseValue:inputValue.text];
    float targetValue = [converter convert:sourceValue];
    outputValue.text = [converter formatValue:targetValue];
    converter = nil;
}

@end
