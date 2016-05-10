//
//  User.m
//  Roth Touchline
//
//  Created by Iura Gutu on 12/10/15.
//  Copyright © 2015 deCode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"




@implementation User

@synthesize langChoice;

static id self_instance;

+ (void) resetSelf{
    self_instance = nil;
    
}
- (id) init {
    
    self = [super init];
    if (self!=nil) {
        
        langChoice = 1;
        
    }
    return self;
}



- (void) saveToFile{
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:fileName];
    
}

+ (User*) readFromFile{
    
    if( self_instance == nil ){
        
  
        NSData *userData = [[NSUserDefaults standardUserDefaults] objectForKey:fileName];
        self_instance = [NSKeyedUnarchiver unarchiveObjectWithData:userData];
        
        
    }
    
    return self_instance;
    
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super init]) // this needs to be [super initWithCoder:aDecoder] if the superclass implements NSCoding
    {
       
        
        langChoice = [aDecoder decodeIntForKey:@"langChoice"];
        
        
    }
    
    return self;
}


- (void)encodeWithCoder:(NSCoder *)encoder
{
    // add [super encodeWithCoder:encoder] if the superclass implements NSCoding
    
   
   
  
    [encoder encodeInt: langChoice forKey:@"langChoice"];
    
    
    
    
    
}




@end