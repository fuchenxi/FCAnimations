//
//  FCItem.h
//  FCAnimations
//
//  Created by fcx on 2017/12/27.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FCItem : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) id        object;
@property (nonatomic)         NSInteger index;

+ (instancetype)itemWithObject:(id)object name:(NSString *)name;

@property (nonatomic, strong, readonly) NSMutableAttributedString *nameString;

@end
