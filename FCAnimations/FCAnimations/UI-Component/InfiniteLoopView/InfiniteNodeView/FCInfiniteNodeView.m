//
//  FCInfiniteNodeView.m
//  FCAnimations
//
//  Created by fcx on 2017/12/28.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import "FCInfiniteNodeView.h"

@implementation FCInfiniteNodeView

- (void)changeToState:(EInfiniteLoopNodeState)state animated:(BOOL)animated {
    
    [NSException raise:@"FCInfiniteNodeView error"
                format:@"You must overwrite this method."];
}

@end
