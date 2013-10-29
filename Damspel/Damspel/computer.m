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
    bool geslagen = false;
    NSArray *alleHokjes = [veld.hokjes allValues];
    for (hokje *h in alleHokjes) {
        do {
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
                    hokje *hTarget;
                    
                    // Linksonder
                    hTarget = [veld.hokjes objectForKey:checkLO];
                    if (hTarget.inhoud != self.kleur) {
                        // Hokje erachter checken
                        NSString *checkLO2 = [[NSString alloc] initWithFormat:@"%i,%i", hokX-2, hokY+2];
                        hokje *h2 = [veld.hokjes objectForKey:checkLO2];
                        
                        if (h2.inhoud == '0') {
                            [self slaMet:h.loc op:checkLO verplaats:checkLO2 in:veld.hokjes];
                            geslagen = true;
                        }
                    }else if (hTarget.inhoud == self.kleur) {
                        // Niks doen
                    }else if (hTarget.inhoud == '0') {
                        [self zetVan:h.loc naar:checkLO in:veld.hokjes];
                    }
                    
                    // Rechtsonder
                    hTarget = [veld.hokjes objectForKey:checkRO];
                    if (hTarget.inhoud != self.kleur) {
                        // Hokje erachter checken
                        NSString *checkRO2 = [[NSString alloc] initWithFormat:@"%i,%i", hokX-2, hokY+2];
                        hokje *h2 = [veld.hokjes objectForKey:checkRO2];
                        
                        if (h2.inhoud == '0') {
                            [self slaMet:h.loc op:checkRO verplaats:checkRO2 in:veld.hokjes];
                            geslagen = true;
                        }
                    }else if (hTarget.inhoud == self.kleur) {
                        // Niks doen
                    }else if (hTarget.inhoud == '0') {
                        [self zetVan:h.loc naar:checkRO in:veld.hokjes];
                    }
                }else if (self.kleur == 'Z') {
                    NSString *checkLB = [[NSString alloc] initWithFormat:@"%i,%i", hokX-1, hokY-1];
                    NSString *checkRB = [[NSString alloc] initWithFormat:@"%i,%i", hokX+1, hokY-1];
                    hokje *hTarget;
                    
                    // Linksboven
                    hTarget = [veld.hokjes objectForKey:checkLB];
                    if (hTarget.inhoud != self.kleur) {
                        // Hokje erachter checken
                        NSString *checkLB2 = [[NSString alloc] initWithFormat:@"%i,%i", hokX-2, hokY-2];
                        hokje *h2 = [veld.hokjes objectForKey:checkLB2];
                        
                        if (h2.inhoud == '0') {
                            [self slaMet:h.loc op:checkLB verplaats:checkLB2 in:veld.hokjes];
                            geslagen = true;
                        }
                    }else if (hTarget.inhoud == self.kleur) {
                        // Niks doen
                    }else if (hTarget.inhoud == '0') {
                        [self zetVan:h.loc naar:checkLB in:veld.hokjes];
                    }
                    
                    // Rechtsboven
                    hTarget = [veld.hokjes objectForKey:checkRB];
                    if (hTarget.inhoud != self.kleur) {
                        // Hokje erachter checken
                        NSString *checkRB2 = [[NSString alloc] initWithFormat:@"%i,%i", hokX+2, hokY-2];
                        hokje *h2 = [veld.hokjes objectForKey:checkRB2];
                        
                        if (h2.inhoud == '0') {
                            [self slaMet:h.loc op:checkRB verplaats:checkRB2 in:veld.hokjes];
                            geslagen = true;
                        }
                    }else if (hTarget.inhoud == self.kleur) {
                        // Niks doen
                    }else if (hTarget.inhoud == '0') {
                        [self zetVan:h.loc naar:checkRB in:veld.hokjes];
                    }
                }
                
            }
        } while (geslagen == false);
    }
}

- (void) slaMet:(NSString *)locSteen op:(NSString *)locSla verplaats:(NSString *)locPlaats in:(NSDictionary *)hokjes
{
    hokje *hHuidig = [hokjes objectForKey:locSteen];
    hokje *hTarget = [hokjes objectForKey:locSla];
    hokje *hLeeg = [hokjes objectForKey:locPlaats];
    
    hHuidig.inhoud = '0';
    hTarget.inhoud = '0';
    hLeeg.inhoud = self.kleur;
    self.steentjesTegenstander = self.steentjesTegenstander-1;
}

- (void) zetVan:(NSString *)locVan naar:(NSString *)locNaar in:(NSDictionary *)hokjes
{
    hokje *hHuidig = [hokjes objectForKey:locVan];
    hokje *hTarget = [hokjes objectForKey:locNaar];
    
    hHuidig.inhoud = '0';
    hTarget.inhoud = self.kleur;
}

@end
