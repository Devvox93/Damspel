//
//  speelveld.m
//  Damspel
//
//  Created by Patrick Böhner on 9/11/13.
//  Copyright (c) 2013 KB50-1. All rights reserved.
//

#import "speelveld.h"
#import "hokje.h"

@implementation speelveld
@synthesize grootte;

- (id) initMetGrootte: (int) nieuweGrootte
{
    self = [super init];
    if (self){
        grootte = nieuweGrootte;
        hokjes = [[NSDictionary alloc] init];
        for (int x=0; x<10; x++) {
            for (int y=0; y<grootte; y++) {
                hokje *h = [[hokje alloc] init];
                NSString *tempLoc = [[NSString alloc] initWithFormat:@"%d,%d",x,y];
                h.loc = tempLoc;
                h.inhoud = @"0";
                
                [hokjes insertValue:(id) h inPropertyWithKey:tempLoc];
                
                [tempLoc release];
                [h release];
            }
        }
    }
    
    return self;
}

- (hokje *)getHokjeWithLoc: (NSString *) loc
{
    return [hokjes objectForKey:loc];
}

- (void) printVeld
{
    printf("   0  1  2  3  4  5  6  7  8  9 \n");
    for (int y=0; y<grootte; y++) {
        printf("0 ");
        for (int x=0; x<10; x++) {
            NSString *tempLoc = [[NSString alloc] initWithFormat:@"%d,%d",x,y];
            hokje * h = [hokjes objectForKey:tempLoc];
            if ([h.inhoud  isEqual: @"Z"]) {
                printf("[Z]");
            }else if ([h.inhoud  isEqual: @"W"]) {
                printf("[W]");
            }else {
                printf("[ ]");
            }
        }
        printf("\n");
    }
}

@end
