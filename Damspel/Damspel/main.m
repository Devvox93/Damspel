//
//  main.c
//  Damspel
//
//  Created by Patrick Böhner on 9/10/13.
//  Copyright (c) 2013 KB50-1. All rights reserved.
//

#include <stdio.h>
#include "speelveld.h"

int main(int argc, const char * argv[])
{
    int nieuweGrootte;
    
    do{
        printf("Hoe veel rijen wil je in het veld? (minimaal '10')\n");
        scanf("%i", &nieuweGrootte);
    }while (nieuweGrootte < 10);
    
    speelveld *veld = [[speelveld alloc] initWithGrootte: nieuweGrootte];
    [veld printVeld];

    return 0;
}