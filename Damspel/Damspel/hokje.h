//
//  hokje.h
//  Damspel
//
//  Created by Patrick Böhner on 9/11/13.
//  Copyright (c) 2013 KB50-1. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface hokje : NSObject{
    NSString *loc;
    char inhoud;
}
@property (nonatomic, assign) NSString *loc;
@property (nonatomic, retain) char inhoud;

@end
