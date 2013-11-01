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
    bool gezet = false;
    NSArray *alleHokjes = [veld.hokjes allValues];
    
    for (hokje *h in alleHokjes) {
        if (gezet == false) {
            if (h.inhoud == self.kleur) {
                NSString *loc = h.loc;
                
                // Locatie van huidig hokje ophalen
                NSArray *substrings = [loc componentsSeparatedByString:@","];
                NSString *sub1 = [substrings objectAtIndex:0];
                NSString *sub2 = [substrings objectAtIndex:1];
                int hokX = [sub1 intValue];
                int hokY = [sub2 intValue];
                
                // Hokjes checken
                if (self.kleur == 'W') {
                    NSString *checkLO = [[NSString alloc] initWithFormat:@"%i,%i", hokX-1, hokY+1];
                    NSString *checkRO = [[NSString alloc] initWithFormat:@"%i,%i", hokX+1, hokY+1];
                    hokje *hTarget;
                    
                    // Linksonder
                    hTarget = [veld.hokjes objectForKey:checkLO];
                    if (hTarget.inhoud != self.kleur && hTarget.inhoud != '0' && gezet == false) {
                        // Hokje erachter checken
                        NSString *checkLO2 = [[NSString alloc] initWithFormat:@"%i,%i", hokX-2, hokY+2];
                        hokje *h2 = [veld.hokjes objectForKey:checkLO2];
                        
                        if (h2.inhoud == '0') {
                            [self slaMet:self van:h.loc op:checkLO verplaats:checkLO2 in:veld.hokjes];
                            gezet = true;
                        }
                    }else if (hTarget.inhoud == self.kleur && gezet == false) {
                        // Niks doen
                    }else if (hTarget.inhoud == '0' && gezet == false) {
                        [self zet:self van:h.loc naar:checkLO in:veld.hokjes];
                        gezet = true;
                    }
                    
                    // Rechtsonder
                    hTarget = [veld.hokjes objectForKey:checkRO];
                    if (hTarget.inhoud != self.kleur && hTarget.inhoud != '0' && gezet == false) {
                        // Hokje erachter checken
                        NSString *checkRO2 = [[NSString alloc] initWithFormat:@"%i,%i", hokX-2, hokY+2];
                        hokje *h2 = [veld.hokjes objectForKey:checkRO2];
                        
                        if (h2.inhoud == '0') {
                            [self slaMet:self van:h.loc op:checkRO verplaats:checkRO2 in:veld.hokjes];
                            gezet = true;
                        }
                    }else if (hTarget.inhoud == self.kleur && gezet == false) {
                        // Niks doen
                    }else if (hTarget.inhoud == '0' && gezet == false) {
                        [self zet:self van:h.loc naar:checkRO in:veld.hokjes];
                        gezet = true;
                    }
                }else if (self.kleur == 'Z') {
                    NSString *checkLB = [[NSString alloc] initWithFormat:@"%i,%i", hokX-1, hokY-1];
                    NSString *checkRB = [[NSString alloc] initWithFormat:@"%i,%i", hokX+1, hokY-1];
                    hokje *hTarget;
                    
                    // Linksboven
                    hTarget = [veld.hokjes objectForKey:checkLB];
                    if (hTarget.inhoud != self.kleur&& hTarget.inhoud != '0' && gezet == false) {
                        // Hokje erachter checken
                        NSString *checkLB2 = [[NSString alloc] initWithFormat:@"%i,%i", hokX-2, hokY-2];
                        hokje *h2 = [veld.hokjes objectForKey:checkLB2];
                        
                        if (h2.inhoud == '0' && gezet == false) {
                            [self slaMet:self van:h.loc op:checkLB verplaats:checkLB2 in:veld.hokjes];
                            gezet = true;
                        }
                    }else if (hTarget.inhoud == self.kleur && gezet == false) {
                        // Niks doen
                    }else if (hTarget.inhoud == '0' && gezet == false) {
                        [self zet:self van:h.loc naar:checkLB in:veld.hokjes];
                        gezet = true;
                    }
                    
                    // Rechtsboven
                    hTarget = [veld.hokjes objectForKey:checkRB];
                    if (hTarget.inhoud != self.kleur && hTarget.inhoud != '0' && gezet == false) {
                        // Hokje erachter checken
                        NSString *checkRB2 = [[NSString alloc] initWithFormat:@"%i,%i", hokX+2, hokY-2];
                        hokje *h2 = [veld.hokjes objectForKey:checkRB2];
                        
                        if (h2.inhoud == '0') {
                            [self slaMet:self van:h.loc op:checkRB verplaats:checkRB2 in:veld.hokjes];
                            gezet = true;
                        }
                    }else if (hTarget.inhoud == self.kleur && gezet == false) {
                        // Niks doen
                    }else if (hTarget.inhoud == '0' && gezet == false) {
                        [self zet:self van:h.loc naar:checkRB in:veld.hokjes];
                        gezet = true;
                    }
                }
            }
        }
    }
}

@end
