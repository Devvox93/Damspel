//
//  computer.m
//  Damspel
//
//  Created by Patrick Böhner on 9/11/13.
//  Copyright (c) 2013 KB50-1. All rights reserved.
//

#import "computer.h"
#import "hokje.h"

@implementation computer

- (void) automaat:(speelveld *)veld
{
    NSArray *alleHokjes = [veld.hokjes allValues];
    for (hokje *h in alleHokjes) {
        if (h.inhoud == self.kleur) {
            NSString *loc = h.loc;
            
            // Locatie van huidig hokje ophalen
            NSArray *substrings = [loc componentsSeparatedByString:@","];
            NSString *sub1 = [substrings objectAtIndex:1];
            NSString *sub2 = [substrings objectAtIndex:2];
            int hokX = [sub1 intValue];
            int hokY = [sub2 intValue];
            
            // Hokjes checken
            if (self.kleur == 'W') {
                NSString *checkLO = [[NSString alloc] initWithFormat:@"%i,%i", hokX-1, hokY+1];
                NSString *checkRO = [[NSString alloc] initWithFormat:@"%i,%i", hokX+1, hokY+1];
                hokje *hSla;
                
                // Linksonder
                hSla = [veld.hokjes objectForKey:checkLO];
                if (hSla.inhoud != self.kleur) {
                    // Hokje erachter checken
                    NSString *checkLO2 = [[NSString alloc] initWithFormat:@"%i,%i", hokX-2, hokY+2];
                    hokje *h2 = [veld.hokjes objectForKey:checkLO2];
                    
                    if (h2.inhoud == '0') {
                        [self slaMet:h.loc op:checkLO];
                    }
                }else if (hSla.inhoud == self.kleur) {
                    // Niks doen
                }else if (hSla.inhoud == '0') {
                    [self zet];
                }
                
                // Rechtsonder
                hSla = [veld.hokjes objectForKey:checkRO];
                if (hSla.inhoud != self.kleur) {
                    // Hokje erachter checken
                    NSString *checkRO2 = [[NSString alloc] initWithFormat:@"%i,%i", hokX-2, hokY+2];
                    hokje *h2 = [veld.hokjes objectForKey:checkRO2];
                    
                    if (h2.inhoud == '0') {
                        [self slaMet:h.loc op:checkRO];
                    }
                }else if (hSla.inhoud == self.kleur) {
                    // Niks doen
                }else if (hSla.inhoud == '0') {
                    [self zet];
                }
            }else if (self.kleur == 'Z') {
                NSString *checkLB = [[NSString alloc] initWithFormat:@"%i,%i", hokX-1, hokY-1];
                NSString *checkRB = [[NSString alloc] initWithFormat:@"%i,%i", hokX+1, hokY-1];
                hokje *hSla;
                
                // Linksboven
                hSla = [veld.hokjes objectForKey:checkLB];
                if (hSla.inhoud != self.kleur) {
                    // Hokje erachter checken
                    NSString *checkLB2 = [[NSString alloc] initWithFormat:@"%i,%i", hokX-2, hokY-2];
                    hokje *h2 = [veld.hokjes objectForKey:checkLB2];
                    
                    if (h2.inhoud == '0') {
                        [self slaMet:h.loc op:checkLB];
                    }
                }else if (hSla.inhoud == self.kleur) {
                    // Niks doen
                }else if (hSla.inhoud == '0') {
                    [self zet];
                }
                
                // Rechtsboven
                hSla = [veld.hokjes objectForKey:checkRB];
                if (hSla.inhoud != self.kleur) {
                    // Hokje erachter checken
                    NSString *checkRB2 = [[NSString alloc] initWithFormat:@"%i,%i", hokX+2, hokY-2];
                    hokje *h2 = [veld.hokjes objectForKey:checkRB2];
                    
                    if (h2.inhoud == '0') {
                        [self slaMet:h.loc op:checkRB];
                    }
                }else if (hSla.inhoud == self.kleur) {
                    // Niks doen
                }else if (hSla.inhoud == '0') {
                    [self zet];
                }
            }
            
        }
    }
}

- (void) slaMet:(NSString *)locSteen op:(NSString *)locSla
{
    
}

- (void) zet
{
    
}

@end
