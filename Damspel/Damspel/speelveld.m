//
//  speelveld.m
//  Damspel
//
//  Created by Patrick Böhner on 9/11/13.
//  Copyright (c) 2013 KB50-1. All rights reserved.
//

#import "speelveld.h"
#import "hokje.h"

@implementation speelveld

- (id) initMetGrootte: (int) grootte
{
    self = [super init];
    if (self){
        hokjes = [[NSDictionary alloc] init];
        for (int i=0; i<grootte; i++) {
            hokje *h = [[hokje alloc] init];
            h.inhoud = @"0";
            
            [hokjes insertValue:(id) h inPropertyWithKey:<#(NSString *)#> h.loc]
        }
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

- (hokje *)getHokjeWithLoc: NSString *loc
{
    return hokjes[loc];
}
- (void) printVeld
{
    
}

@end
