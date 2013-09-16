//
//  speelveld.h
//  Damspel
//
//  Created by Patrick Böhner on 9/11/13.
//  Copyright (c) 2013 KB50-1. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "hokje.h"

@interface speelveld : NSObject{
    NSDictionary *hokjes;
    int grootte;
}
@property (nonatomic, assign) int grootte;

- (id) initMetGrootte: (int) nieuweGrootte;
- (hokje *) getHokjeWithLoc: (NSString *) loc;
- (void) printVeld;

@end
