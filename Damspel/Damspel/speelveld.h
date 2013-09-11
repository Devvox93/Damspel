//
//  speelveld.h
//  Damspel
//
//  Created by Patrick Böhner on 9/11/13.
//  Copyright (c) 2013 KB50-1. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#include "hokje.h"

@interface speelveld : NSObject{
    NSArray *rijX;
    NSArray *rijY;
}
- (id) initMetGrootte: (int) grootte;
- (hokje *) getHokje: (int) locX: (int) locY;
- (void) printVeld;

@end
