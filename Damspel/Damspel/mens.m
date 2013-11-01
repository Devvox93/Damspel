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
    bool juisteZet = false;
    int selX;
    int selY;
    int zetX;
    int zetY;
    NSString *selLoc;
    NSString *zetLoc;
    
    do {
        // Steen selecteren
        printf("Welke steen wil je verplaatsen?\n");
        printf("X: ");
        scanf("%i", &selX);
        printf("Y: ");
        scanf("%i", &selY);
        selLoc = [[NSString alloc] initWithFormat:@"%i,%i", selX, selY];
        
        // Waar neerzetten/slaan?
        printf("Waar wil je naartoe verplaatsen?\n");
        printf("X: ");
        scanf("%i", &zetX);
        printf("Y: ");
        scanf("%i", &zetY);
        zetLoc = [[NSString alloc] initWithFormat:@"%i,%i", zetX, zetY];
        
        NSString *slaCheck = [self slaLocatie:self dictionary:veld.hokjes];
        if (![slaCheck isEqualToString:@"Geen"]) {
            if (![zetLoc isEqualToString:slaCheck]) {
                printf("Voer de juiste zet uit om te slaan.\n");
            } else {
                juisteZet = true;
            }
        } else {
            juisteZet = true;
        }
    } while (juisteZet == false);
    
    // Check of het slaan is
    if (self.kleur == 'W') {
        if (zetY == selY+1) {
            [self zet:self van:selLoc naar:zetLoc in:veld.hokjes];
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
        }
    } else if (self.kleur == 'Z') {
        if (zetY == selY-1) {
            [self zet:self van:selLoc naar:zetLoc in:veld.hokjes];
        } else if (zetY == selY-2) {
            int slaX;
            int slaY = selY-1;
            
            if (zetX == selX+2) {
                slaX = selX+1;
            } else {
                slaX = selX-1;
            }
            
            NSString *slaLoc = [[NSString alloc] initWithFormat:@"%i,%i", slaX, slaY];
            [self slaMet:self van:selLoc op:slaLoc verplaats:zetLoc in:veld.hokjes];
        }
    }
}

@end
