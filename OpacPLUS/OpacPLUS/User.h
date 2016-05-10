//
//  User.h
//  Roth Touchline
//
//  Created by Iura Gutu on 12/10/15.
//  Copyright © 2015 deCode. All rights reserved.
//

#ifndef User_h
#define User_h

#define fileName @"user.opacplus"



@interface User : NSObject <NSCoding>
{
    
    
}

@property (nonatomic) int langChoice;

- (void) saveToFile;

+ (User*) readFromFile;

+ (void) resetSelf;

@end


#endif /* User_h */
