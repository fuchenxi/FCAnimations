
//
//  FCRectNodeView.m
//  FCAnimations
//
//  Created by fcx on 2017/12/28.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import "FCRectNodeView.h"

@interface FCRectNodeView ()

@property (nonatomic, strong) UIView *colorView;

@end

@implementation FCRectNodeView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.colorView = ({
            
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 16)];
            view.center = self.middlePoint;
            view.layer.masksToBounds = YES;
            [self addSubview:view];
            view;
        });
    }
    return self;
}

- (void)changeToState:(EInfiniteLoopNodeState)state animated:(BOOL)animated {
    
    if (animated) {
        
        [UIView animateWithDuration:0.5f animations:^{
            
            [self redViewWithState:state];
        }];
        
    } else {
        
        [self redViewWithState:state];
    }
}

- (void)redViewWithState:(EInfiniteLoopNodeState)state {
    
    if (state == kInfiniteLoopNormalState) {
        
        self.colorView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5f];
        
    } else {
        
        self.colorView.backgroundColor = [UIColor redColor];
    }
}

@end
