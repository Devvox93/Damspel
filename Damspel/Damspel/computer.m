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

- (bool) kanSlaan:(speelveld *)veld
{
    bool kanSlaan = false;
    
    NSArray *alleHokjes = [veld.hokjes allValues];
    for (hokje *h in alleHokjes) {
        if (h.inhoud == self.kleur) {
            NSString *loc 
        }
    }
    
    return kanSlaan;
}

- (void) zet:(speelveld *)veld
{
    if ([self kanSlaan:veld]) {
        
    }
}

@end
