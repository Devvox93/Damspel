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
@synthesize grootte;
@synthesize hokjes;

- (id) initWithGrootte: (int) nieuweGrootte
{
    self = [super init];
    if (self){
        grootte = nieuweGrootte;
        hokjes = [[NSMutableDictionary alloc] init];
        for (int x=0; x<10; x++) {
            for (int y=0; y<grootte; y++) {
                hokje *h = [[hokje alloc] init];
                NSString *tempLoc = [[NSString alloc] initWithFormat:@"%d,%d",x,y];
                h.loc = tempLoc;
                
                if(y<4){
                    if(y%2 == 0){
                        if(x%2 == 0){
                            h.inhoud = 'W';
                        }
                    }else{
                        if(x%2 != 0){
                            h.inhoud = 'W';
                        }
                    }
                }else if (y>=grootte-4){
                    if(y%2 == 0){
                        if(x%2 == 0){
                            h.inhoud = 'Z';
                        }
                    }else{
                        if(x%2 != 0){
                            h.inhoud = 'Z';
                        }
                    }
                }else{
                    h.inhoud = '0';
                }
                
                [hokjes setValue: h forKey:tempLoc];
                
                [tempLoc release];
                [h release];
            }
        }
    }
    
    return self;
}

- (hokje *)getHokjeWithLoc: (NSString *) loc
{
    return [hokjes objectForKey:loc];
}

- (void) printVeld
{
    printf("\n\t 0  1  2  3  4  5  6  7  8  9 \n");
    for (int y=0; y<grootte; y++) {
        printf("%i \t", y);
        for (int x=0; x<10; x++) {
            NSString *tempLoc = [[NSString alloc] initWithFormat:@"%d,%d",x,y];
            hokje * h = [hokjes objectForKey:tempLoc];
            if (h.inhoud  == 'Z') {
                printf("[Z]");
            }else if (h.inhoud  == 'W') {
                printf("[W]");
            }else {
                printf("[ ]");
            }
        }
        printf("\n");
    }
    printf("\n");
}

@end
