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
    NSDictionary *hokjes;
}
- (id) initMetGrootte: (int) grootte;
- (hokje *) getHokjeWithX: (int) locX WithY: (int) locY;
- (void) printVeld;

@end
