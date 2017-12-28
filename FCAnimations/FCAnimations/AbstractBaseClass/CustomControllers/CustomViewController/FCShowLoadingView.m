//
//  FCShowLoadingView.m
//  FCAnimations
//
//  Created by fcx on 2017/12/27.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import "FCShowLoadingView.h"

@interface FCShowLoadingView ()

@property (nonatomic) NSInteger count;

@end

@implementation FCShowLoadingView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self setup];
    }
    
    return self;
}

- (instancetype)init {
    
    if (self = [super init]) {
        
        [self setup];
    }
    
    return self;
}

- (void)setup {
    
    self.count = 0;
}

- (void)push {
    
    self.count += 1;
}

- (void)pop {
    
    self.count -= 1;
}

@synthesize count = _count;
- (void)setCount:(NSInteger)count {
    
    _count = count;
    if (_count >= 1) {
        
        self.userInteractionEnabled = YES;
        
    } else {
        
        self.userInteractionEnabled = NO;
    }
}

@end
