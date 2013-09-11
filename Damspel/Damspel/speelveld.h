//
//  speelveld.h
//  Damspel
//
//  Created by Patrick Böhner on 9/11/13.
//  Copyright (c) 2013 KB50-1. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface speelveld : NSObject{
    NSArray *rijX;
    NSArray *rijY;
}
- (id) initMetGrootte: (int) grootte{
    self = [super init];
    if (self){
//        initalisatie (for loop met grootte variabel
//        NSMutableArray *myColors;
//        
//        myColors = [NSMutableArray arrayWithObjects: @"Red", @"Green", @"Blue", @"Yellow", nil];
//        
//        [myColors addObject: @"Indigo"];
//        [myColors addObject: @"Violet"];
    }
    return self;
}
- (hokje) getHokje: (int) locX: (int) locY;
- (void) printVeld;

@end
