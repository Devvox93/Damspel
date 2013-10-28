//
//  speler.h
//  Damspel
//
//  Created by Patrick Böhner on 9/11/13.
//  Copyright (c) 2013 KB50-1. All rights reserved.
//

#import <Cocoa/Cocoa.h>
    
@interface speler : NSObject{
    int steentjesTegenstander;
    char kleur;
}
@property (nonatomic, assign) int steentjesTegenstander;
@property (nonatomic, assign) char kleur;

@end
