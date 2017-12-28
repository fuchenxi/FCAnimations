//
//  UIFont+Fonts.m
//  FCAnimations
//
//  Created by fcx on 2017/12/27.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import "UIFont+Fonts.h"

@implementation UIFont (Fonts)

#pragma mark - Added font.

+ (UIFont *)HYQiHeiWithFontSize:(CGFloat)size {
    
    return [UIFont fontWithName:@"HYQiHei-BEJF" size:size];
}

#pragma mark - System font.

+ (UIFont *)AppleSDGothicNeoThinWithFontSize:(CGFloat)size {
    
    return [UIFont fontWithName:@"AppleSDGothicNeo-Thin" size:size];
}

+ (UIFont *)AvenirWithFontSize:(CGFloat)size {
    
    return [UIFont fontWithName:@"Avenir" size:size];
}

+ (UIFont *)AvenirLightWithFontSize:(CGFloat)size {
    
    return [UIFont fontWithName:@"Avenir-Light" size:size];
}

+ (UIFont *)HeitiSCWithFontSize:(CGFloat)size {
    
    return [UIFont fontWithName:@"Heiti SC" size:size];
}

+ (UIFont *)HelveticaNeueFontSize:(CGFloat)size {
    
    return [UIFont fontWithName:@"HelveticaNeue" size:size];
}

+ (UIFont *)HelveticaNeueBoldFontSize:(CGFloat)size {
    
    return [UIFont fontWithName:@"HelveticaNeue-Bold" size:size];
}

@end
