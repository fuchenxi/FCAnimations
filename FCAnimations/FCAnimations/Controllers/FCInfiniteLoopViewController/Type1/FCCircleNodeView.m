//
//  FCCircleNodeView.m
//  FCAnimations
//
//  Created by fcx on 2017/12/28.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import "FCCircleNodeView.h"

@interface FCCircleNodeView ()

@property (nonatomic, strong) UIView  *colorView;

@end

@implementation FCCircleNodeView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.colorView = ({
            
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 3, 3)];
            view.layer.cornerRadius  = view.width / 2.f;
            view.center              = self.middlePoint;
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
        
        self.colorView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.25f];
        self.colorView.scale           = 1.f;
        
    } else {
        
        self.colorView.backgroundColor = [UIColor cyanColor];
        self.colorView.scale           = 1.75f;
    }
}

@end
