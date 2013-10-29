//
//  main.c
//  Damspel
//
//  Created by Patrick Böhner on 9/10/13.
//  Copyright (c) 2013 KB50-1. All rights reserved.
//

#include <stdio.h>
#import "speelveld.h"
#import "speler.h"
#import "mens.h"
#import "computer.h"

int main(int argc, const char * argv[])
{
    // Grootte vragen, veld aanmaken en printen.
    int nieuweGrootte;
    
    do{
        printf("Hoe veel rijen wil je in het veld? (minimaal '10')\n");
        scanf("%i", &nieuweGrootte);
    }while (nieuweGrootte < 10);
    
    speelveld *veld = [[speelveld alloc] initWithGrootte: nieuweGrootte];
    [veld printVeld];

    // Spelers aanmaken en kleur aan spelers toewijzen
    computer *ai = [[computer alloc] init];
    mens *human = [[mens alloc] init];
    
    char antwoord[2];
    printf("Wil jij de eerste zet doen? (Y/N) ");
    scanf("%1s", antwoord);
    
    NSString *cast = [NSString stringWithFormat:@"%s", antwoord];
    
    if ([cast isEqualToString:@"Y"] || [cast isEqualToString:@"y"]) {
        ai.kleur = 'Z';
        human.kleur = 'W';
        printf("Kleur human: %c", human.kleur);
    } else if ([cast isEqualToString:@"N"] || [cast isEqualToString:@"n"]) {
        human.kleur = 'Z';
        ai.kleur = 'W';
    } else {
        printf("Je hebt geen goed antwoord ingevuld.\n");
    }
    
//    printf("Na kleur zetten\n");
//    printf("Kleur human: %c\n", human.kleur);
    
    int spelerGezet;
    // Als de mens wit is kan hij de eerste zet doen
    if (human.kleur == 'W') {
        printf("Voor zet\n");
        [human zet:veld];
        spelerGezet = 0;
        printf("na zet\n");
    }else{
        [ai automaat:veld];
        spelerGezet = 1;
    }
    
    // Zolang beide spelers nog steentjes hebben wordt er gespeeld.
    while (human.steentjesTegenstander > 0 && ai.steentjesTegenstander > 0) {
        if (spelerGezet == 1) {
            [human zet:veld];
            spelerGezet = 0;
        } else if (spelerGezet == 0) {
            [ai automaat:veld];
            spelerGezet = 1;
        }
        
        [veld printVeld];
    }
    
    return 0;
}