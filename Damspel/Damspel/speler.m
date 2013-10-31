//
//  speler.m
//  Damspel
//
//  Created by Patrick Böhner on 9/11/13.
//  Copyright (c) 2013 KB50-1. All rights reserved.
//

#import "speler.h"
#import "hokje.h"
#import "mens.h"
#import "computer.h"

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
    speler.steentjesTegenstander = speler.steentjesTegenstander-1;
    
    // Printen van slaan
    if ([speler isKindOfClass:[mens class]]) {
        printf("Jij slaat ");
    } else if ([speler isKindOfClass:[computer class]]) {
        printf("De computer slaat ");
    }
    
    printf("%s", [locSla UTF8String]);
    printf(" met ");
    printf("%s", [locSteen UTF8String]);
    printf(" en staat nu op ");
    printf("%s", [locPlaats UTF8String]);
    printf(".\n");
    
    // Print aantal steentjes
    printf("De tegenstander heeft nu %i steentjes.\n", speler.steentjesTegenstander);
}

- (void) zet:(speler *)speler van:(NSString *)locVan naar:(NSString *)locNaar in:(NSDictionary *)hokjes
{
    hokje *hHuidig = [hokjes objectForKey:locVan];
    hokje *hTarget = [hokjes objectForKey:locNaar];
    
    hHuidig.inhoud = '0';
    hTarget.inhoud = speler.kleur;
    
    // Printen van zet
    if ([speler isKindOfClass:[mens class]]) {
        printf("Jij zet ");
    } else if ([speler isKindOfClass:[computer class]]) {
        printf("De computer zet ");
    }
    
    printf("van ");
    printf("%s", [locVan UTF8String]);
    printf(" naar ");
    printf("%s", [locNaar UTF8String]);
    printf(".\n");
}

@end
