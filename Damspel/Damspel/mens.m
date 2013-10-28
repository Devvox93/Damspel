//
//  mens.m
//  Damspel
//
//  Created by Patrick Böhner on 9/11/13.
//  Copyright (c) 2013 KB50-1. All rights reserved.
//

#import "mens.h"

@implementation mens

- (void) kanSlaan
{
    
}
- (void) zet
{
    
}
- (void) selecteer
{
    bool gezet = false;
    do {
        // Steen selecteren
        int selX;
        int selY;
        printf("Welke steen wil je verplaatsen?\n");
        scanf("X: %i\n", &selX);
        scanf("Y: %i\n", &selY);
        NSString *selLoc = [[NSString alloc] initWithFormat:@"%i,%i", selX, selY];
        
        // 
        
    } while (gezet == false);
}

@end
