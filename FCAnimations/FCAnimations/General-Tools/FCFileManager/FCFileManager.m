//
//  FCFileManager.m
//  FCAnimations
//
//  Created by fcx on 2017/12/29.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import "FCFileManager.h"

@implementation FCFileManager

+ (NSString *)bundleFileWithName:(NSString *)name {
    
    return [[NSBundle mainBundle] pathForResource:name ofType:nil];
}

@end
