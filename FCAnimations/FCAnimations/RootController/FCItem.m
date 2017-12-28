//
//  FCItem.m
//  FCAnimations
//
//  Created by fcx on 2017/12/27.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import "FCItem.h"

@interface FCItem ()

@end

@implementation FCItem

+ (instancetype)itemWithObject:(id)object name:(NSString *)name {
    
    FCItem *item  = [[[self class] alloc] init];
    item.name   = name;
    item.object = object;
    
    return item;
}

//- (NSMutableAttributedString *)nameString {
//
//    if (_nameString == nil) {
//
//        NSString *fullStirng = [NSString stringWithFormat:@"%02ld. %@", (long)self.index, self.name];
//
//        NSMutableAttributedString *richString = [NSMutableAttributedString mutableAttributedStringWithString:fullStirng config:^(NSString *string, NSMutableArray<AttributedStringConfig *> *configs) {
//
//            [configs addObject:[FontAttributeConfig configWithFont:[UIFont HeitiSCWithFontSize:16.f] range:NSMakeRange(0, string.length)]];
//            [configs addObject:[FontAttributeConfig configWithFont:[UIFont fontWithName:@"GillSans-Italic" size:16.f] range:NSMakeRange(0, 3)]];
//            [configs addObject:[ForegroundColorAttributeConfig configWithColor:[[UIColor blackColor] colorWithAlphaComponent:0.65f] range:NSMakeRange(0, string.length)]];
//            [configs addObject:[ForegroundColorAttributeConfig configWithColor:[[UIColor redColor] colorWithAlphaComponent:0.65f] range:NSMakeRange(0, 3)]];
//        }];
//
//        _nameString = richString;
//    }
//
//    return _nameString;
//}

@end
