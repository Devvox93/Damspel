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

    // Spelers aanmaken, aantal steentjes setten en kleur aan spelers toewijzen
    computer *ai = [[computer alloc] init];
    mens *human = [[mens alloc] init];
    ai.steentjesTegenstander = 20;
    human.steentjesTegenstander = 20;
    
    char antwoord[2];
    printf("Wil jij de eerste zet doen? (Y/N) ");
    scanf("%1s", antwoord);
    
    NSString *cast = [NSString stringWithFormat:@"%s", antwoord];
    
    if ([cast isEqualToString:@"Y"] || [cast isEqualToString:@"y"]) {
        ai.kleur = 'Z';
        human.kleur = 'W';
        printf("Kleur human: %c\n", human.kleur);
    } else if ([cast isEqualToString:@"N"] || [cast isEqualToString:@"n"]) {
        human.kleur = 'Z';
        ai.kleur = 'W';
    } else {
        printf("Je hebt geen goed antwoord ingevuld.\n");
    }
    
    int spelerGezet;
    // Als de mens wit is kan hij de eerste zet doen
    if (human.kleur == 'W') {
        [human selecteer:veld];
        spelerGezet = 0;
    }else{
        [ai automaat:veld];
        spelerGezet = 1;
    }
    
    // Zolang beide spelers nog steentjes hebben wordt er gespeeld.
    while (human.steentjesTegenstander > 0 && ai.steentjesTegenstander > 0) {
        [veld printVeld];
        if (spelerGezet == 1) {
            [human selecteer:veld];
            spelerGezet = 0;
        } else if (spelerGezet == 0) {
            [ai automaat:veld];
            spelerGezet = 1;
        }
    }
    
    printf("Spel voorbij!");
    
    return 0;
}