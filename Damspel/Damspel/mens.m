//
//  mens.m
//  Damspel
//
//  Created by Patrick Böhner on 9/11/13.
//  Copyright (c) 2013 KB50-1. All rights reserved.
//

#import "mens.h"

@implementation mens

- (void) selecteer:(speelveld *)veld
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
                [self zet:self van:selLoc naar:zetLoc in:veld.hokjes];
                gezet = true;
            } else if (zetY == selY+2) {
                int slaX;
                int slaY = selY+1;
                
                if (zetX == selX+2) {
                    slaX = selX+1;
                } else {
                    slaX = selX-1;
                }
                
                NSString *slaLoc = [[NSString alloc] initWithFormat:@"%i,%i", slaX, slaY];
                [self slaMet:self van:selLoc op:slaLoc verplaats:zetLoc in:veld.hokjes];
                gezet = true;
            }
        } else if (self.kleur == 'Z') {
            if (zetY == selY-1) {
                [self zet:self van:selLoc naar:zetLoc in:veld.hokjes];
                gezet = true;
            } else if (zetY == selY-2) {
                int slaX;
                int slaY = selY+1;
                
                if (zetX == selX+2) {
                    slaX = selX+1;
                } else {
                    slaX = selX-1;
                }
                
                NSString *slaLoc = [[NSString alloc] initWithFormat:@"%i,%i", slaX, slaY];
                [self slaMet:self van:selLoc op:slaLoc verplaats:zetLoc in:veld.hokjes];
                gezet = true;
            }
        }
    } while (gezet == false);
}

@end
