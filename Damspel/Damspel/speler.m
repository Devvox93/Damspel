//
//  speler.m
//  Damspel
//
//  Created by Patrick Böhner on 9/11/13.
//  Copyright (c) 2013 KB50-1. All rights reserved.
//

#import "speler.h"
#import "hokje.h"

@implementation speler
@synthesize steentjesTegenstander;
@synthesize kleur;

- (void) slaMet:(speler *)speler van:(NSString *)locSteen op:(NSString *)locSla verplaats:(NSString *)locPlaats in:(NSDictionary *)hokjes
{
    hokje *hHuidig = [hokjes objectForKey:locSteen];
    hokje *hTarget = [hokjes objectForKey:locSla];
    hokje *hLeeg = [hokjes objectForKey:locPlaats];
    
    hHuidig.inhoud = '0';
    hTarget.inhoud = '0';
    hLeeg.inhoud = speler.kleur;
    speler.steentjesTegenstander = self.steentjesTegenstander-1;
}

- (void) zet:(speler *)speler van:(NSString *)locVan naar:(NSString *)locNaar in:(NSDictionary *)hokjes
{
    hokje *hHuidig = [hokjes objectForKey:locVan];
    hokje *hTarget = [hokjes objectForKey:locNaar];
    
    hHuidig.inhoud = '0';
    hTarget.inhoud = speler.kleur;
}

@end
