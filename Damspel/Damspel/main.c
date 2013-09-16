//
//  main.c
//  Damspel
//
//  Created by Patrick Böhner on 9/10/13.
//  Copyright (c) 2013 KB50-1. All rights reserved.
//

#include <stdio.h>
#import "speelveld.h"

int main(int argc, const char * argv[])
{
    printf("Hoe veel rijen wil je in het veld? (minimaal '10'");
    int nieuweGrootte;
    scanf("%d", &nieuweGrootte);
    speelveld *veld = [[speelveld alloc] initWithGrootte: nieuweGrootte];
//    [veld printVeld];
    
    return 0;
}

