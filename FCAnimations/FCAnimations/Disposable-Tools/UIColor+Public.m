//
//  UIColor+Public.m
//  FCAnimations
//
//  Created by fcx on 2017/12/28.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import "UIColor+Public.h"

@implementation UIColor (Public)

+ (UIColor *)lineColor {
    
    return [UIColor colorWithHexString:@"e8e8e8"];
}

+ (UIColor *)backgroundColor {
    
    return [UIColor colorWithHexString:@"f4f5f6"];
}

+ (UIColor *)randomColor {
    
    return [UIColor colorWithRed:arc4random_uniform(256)/255.0
                           green:arc4random_uniform(256)/255.0
                            blue:arc4random_uniform(256)/255.0 alpha:1.0];
}

@end
