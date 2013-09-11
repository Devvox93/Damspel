//
//  hokje.h
//  Damspel
//
//  Created by Patrick Böhner on 9/11/13.
//  Copyright (c) 2013 KB50-1. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface hokje : NSObject{
    int *locX;
    int *locY;
    NSString *inhoud = [[NSString alloc] initWithFormat:@"0"];
}
@property (nonatomic, retain) int *locX;
@property (nonatomic, retain) int *locY;
@property (nonatomic, retain) NSString *inhoud;

@end
