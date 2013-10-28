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
    
    char antwoord;
    printf("Wil jij de eerste zet doen? (Y/N) ");
    antwoord = getchar();
    
    if (antwoord == 'Y') {
        ai.kleur = 'Z';
        human.kleur = 'W';
    } else {
        human.kleur = 'Z';
        ai.kleur = 'W';
    }
    
    // Als de mens wit is kan hij de eerste zet doen
    if (human.kleur == 'W') {
        [human selecteer];
    }else{
        [ai automaat:veld];
    }
    // Zolang beide spelers nog steentjes hebben wordt er gespeeld.
    while (human.steentjesTegenstander > 0 && ai.steentjesTegenstander > 0) {
        
    }
    
    return 0;
}