//
//  speelveld.m
//  Damspel
//
//  Created by Patrick Böhner on 9/11/13.
//  Copyright (c) 2013 KB50-1. All rights reserved.
//

#import "speelveld.h"

@implementation speelveld

- (id) initMetGrootte: (int) grootte
{
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

- (hokje *) getHokje: (int) locX: (int) locY
{
    return rijX[0];
}
- (void) printVeld
{
    
}

@end
