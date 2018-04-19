//
//  NSData+JsonData.m
//  FCAnimations
//
//  Created by fcx on 2017/12/29.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import "NSData+JsonData.h"

@implementation NSData (JsonData)

- (id)toListProperty {
    
    if (self) {
        
        return [NSJSONSerialization JSONObjectWithData:self
                                               options:NSJSONReadingMutableLeaves | NSJSONReadingAllowFragments
                                                 error:nil];
    } else {
        
        return nil;
    }
}

@end
