//
//  computer.h
//  Damspel
//
//  Created by Patrick Böhner on 9/11/13.
//  Copyright (c) 2013 KB50-1. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#include "speler.h"
#include "speelveld.h"

@interface computer : speler{
    
}
- (void) automaat:(speelveld *)veld;
- (void) zet;
- (void) slaMet:(NSString *)locSteen op:(NSString *)locSla;

@end
