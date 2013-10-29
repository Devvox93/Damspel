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
- (void) zet:(speelveld *)veld
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
        
        // Waar neerzetten/slaan?
        int zetX;
        int zetY;
        printf("Waar wil je naartoe verplaatsen?\n");
        scanf("X: %i\n", &zetX);
        scanf("Y: %i\n", &zetY);
        NSString *zetLoc = [[NSString alloc] initWithFormat:@"%i,%i", zetX, zetY];
        
        // Check of het slaan is
        if (self.kleur == 'W') {
            if (zetY == selY+1) {
                // zetten
            } else if (zetY == selY+2) {
                // slaan
            }
        } else if (self.kleur == 'Z') {
            if (zetY == selY-1) {
                // zetten
            } else if (zetY == selY-2) {
                // slaan
            }
        }
    } while (gezet == false);
}
- (void) selecteer
{

}

@end
