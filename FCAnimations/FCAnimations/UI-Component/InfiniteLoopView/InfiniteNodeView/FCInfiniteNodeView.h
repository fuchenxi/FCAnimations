//
//  FCInfiniteNodeView.h
//  FCAnimations
//
//  Created by fcx on 2017/12/28.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, EInfiniteLoopNodeState) {
    /**
     Normal State.
     */
    kInfiniteLoopNormalState,
    
    /**
     Highlighted State.
     */
    kInfiniteLoopHighlightedState,
};

@interface FCInfiniteNodeView : UIView

/**
 *  Change the view to specified state.
 *
 *  @param state    EInfiniteLoopNodeState.
 *  @param animated Animated or not.
 */
- (void)changeToState:(EInfiniteLoopNodeState)state animated:(BOOL)animated;

@end
