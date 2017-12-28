//
//  FCInfiniteLoopViewBuilder.m
//  FCAnimations
//
//  Created by fcx on 2017/12/28.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import "FCInfiniteLoopViewBuilder.h"
#import "FCInfiniteLoopView.h"

@interface FCInfiniteLoopViewBuilder () <FCInfiniteLoopViewDelegate, FCInfiniteLoopViewBuilderDelegate>

@property(nonatomic, strong) FCInfiniteLoopView *loopView;
@property(nonatomic, strong) UIView *nodeViewsContentView;
@property(nonatomic, strong) UIView *contentView;

@end

@implementation FCInfiniteLoopViewBuilder

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.scrollDirection    = UICollectionViewScrollDirectionHorizontal;
        self.scrollTimeInterval = 4.f;
        
        self.loopView = ({
            
            FCInfiniteLoopView *loopView = [[FCInfiniteLoopView alloc] initWithFrame:self.bounds];
            loopView.delegate = self;
            [self addSubview:loopView];
            loopView;
        });
        
        self.contentView = ({
            
            UIView *contentView = [[UIView alloc] initWithFrame:self.bounds];
            contentView.userInteractionEnabled = NO;
            [self addSubview:contentView];
            contentView;
        });
        
        self.nodeViewsContentView = ({
            
            UIView *nodeViewsContentView = [[UIView alloc] init];
            nodeViewsContentView.alpha = 0.f;
            nodeViewsContentView.userInteractionEnabled = NO;
            [self addSubview:nodeViewsContentView];
            nodeViewsContentView;
        });
    }
    return self;
}

- (void)infiniteLoopView:(FCInfiniteLoopView *)infiniteLoopView didScrollCurrentPage:(NSInteger)index {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(infiniteLoopViewBuilder:didScrollCurrentPage:)]) {
        
        [self.delegate infiniteLoopViewBuilder:self didScrollCurrentPage:index];
    }
    [self.nodeViewsContentView.subviews enumerateObjectsUsingBlock:^(__kindof FCInfiniteNodeView * _Nonnull obj,
                                                                     NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (index == idx) {
            
            [obj changeToState:kInfiniteLoopHighlightedState animated:YES];
            
        } else {
            
            [obj changeToState:kInfiniteLoopNormalState animated:YES];
        }
    }];
}

- (void)infiniteLoopView:(FCInfiniteLoopView *)infiniteLoopView data:(id<FCInfiniteLoopViewProtocol>)data selectedIndex:(NSInteger)index cell:(FCInfiniteLoopViewCell *)cell {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(infiniteLoopViewBuilder:data:selectedIndex:cell:)]) {
        
        [self.delegate infiniteLoopViewBuilder:self data:data selectedIndex:index cell:cell];
    }
}

- (void)startLoopAnimated:(BOOL)animated {
    
    if (self.nodeViewTemplate == nil) {
        
        [NSException raise:@"InfiniteLoopViewBuilder error"
                    format:@"You must set the property nodeViewTemplate."];
    }
    [self.loopView reset];
    self.loopView.models = self.models;
    self.loopView.scrollDirection = self.scrollDirection;
    self.loopView.scrollTimeInterval = self.scrollTimeInterval;
    [self.loopView prepare];
    animated ? [self.loopView startLoopAnimation] : 0;
    [self managerNodeViewsContentView];
}

- (void)adjustWhenFreeze {
    
    [self.loopView adjustWhenFreeze];
}

- (void)managerNodeViewsContentView {
    
    // Remove all subViews.
    [self.nodeViewsContentView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [obj removeFromSuperview];
    }];
    
    if (self.models.count) {
        
        // NodeViewsContentView add subView.
        CGFloat width                   = self.sampleNodeViewSize.width;
        CGFloat height                  = self.sampleNodeViewSize.height;
        self.nodeViewsContentView.alpha = 1.f;
        
        if (self.position == kNodeViewBottom || self.position == kNodeViewBottomLeft || self.position == kNodeViewBottomRight ||
            self.position == kNodeViewTop    || self.position == kNodeViewTopLeft    || self.position == kNodeViewTopRight) {
            
            self.nodeViewsContentView.frame = CGRectMake(0, 0, width * self.models.count, height);
            
            self.position == kNodeViewBottom ?
            (void)(self.nodeViewsContentView.centerX = self.middleX),
            self.nodeViewsContentView.bottom  = self.height - self.edgeInsets.bottom : 0;
            
            self.position == kNodeViewBottomLeft ?
            (void)(self.nodeViewsContentView.x      = self.edgeInsets.left),
            self.nodeViewsContentView.bottom = self.height - self.edgeInsets.bottom : 0;
            
            self.position == kNodeViewBottomRight ?
            (void)(self.nodeViewsContentView.right  = self.width - self.edgeInsets.right),
            self.nodeViewsContentView.bottom = self.height - self.edgeInsets.bottom : 0;
            
            self.position == kNodeViewTop ?
            (void)(self.nodeViewsContentView.centerX = self.middleX),
            self.nodeViewsContentView.top     = self.edgeInsets.top : 0;
            
            self.position == kNodeViewTopLeft ?
            (void)(self.nodeViewsContentView.x = self.edgeInsets.left),
            self.nodeViewsContentView.y = self.edgeInsets.top : 0;
            
            self.position == kNodeViewTopRight ?
            (void)(self.nodeViewsContentView.right = self.width - self.edgeInsets.right),
            self.nodeViewsContentView.y     = self.edgeInsets.top : 0;
            
            for (int i = 0; i < self.models.count; i++) {
                
                FCInfiniteNodeView *stateView = [[self.nodeViewTemplate.class alloc] initWithFrame:CGRectMake(i * width, 0, width, height)];
                [self.nodeViewsContentView addSubview:stateView];
                
                if (i == 0) {
                    
                    [stateView changeToState:kInfiniteLoopHighlightedState animated:NO];
                    
                } else {
                    
                    [stateView changeToState:kInfiniteLoopNormalState animated:NO];
                }
            }
            
        } else if (self.position == kNodeViewLeft  || self.position == kNodeViewLeftTop  || self.position == kNodeViewLeftBottom ||
                   self.position == kNodeViewRight || self.position == kNodeViewRightTop || self.position == kNodeViewRightBottom) {
            
            self.nodeViewsContentView.frame = CGRectMake(0, 0, width, height  * self.models.count);
            
            self.position == kNodeViewLeft ?
            (void)(self.nodeViewsContentView.centerY = self.middleY),
            self.nodeViewsContentView.x       = self.edgeInsets.left : 0;
            
            self.position == kNodeViewLeftTop ?
            (void)(self.nodeViewsContentView.y = self.edgeInsets.top),
            self.nodeViewsContentView.x = self.edgeInsets.left : 0;
            
            self.position == kNodeViewLeftBottom ?
            (void)(self.nodeViewsContentView.bottom = self.height - self.edgeInsets.bottom),
            self.nodeViewsContentView.x      = self.edgeInsets.left : 0;
            
            self.position == kNodeViewRight ?
            (void)(self.nodeViewsContentView.centerY = self.middleY),
            self.nodeViewsContentView.right   = self.width - self.edgeInsets.right : 0;
            
            self.position == kNodeViewRightTop ?
            (void)(self.nodeViewsContentView.y     = self.edgeInsets.top),
            self.nodeViewsContentView.right = self.width - self.edgeInsets.right : 0;
            
            self.position == kNodeViewRightBottom ?
            (void)(self.nodeViewsContentView.bottom = self.height - self.edgeInsets.bottom),
            self.nodeViewsContentView.right  = self.width - self.edgeInsets.right : 0;
            
            for (int i = 0; i < self.models.count; i++) {
                
                FCInfiniteNodeView *stateView = [[self.nodeViewTemplate.class alloc] initWithFrame:CGRectMake(0, i * height, width, height)];
                [self.nodeViewsContentView addSubview:stateView];
                
                if (i == 0) {
                    
                    [stateView changeToState:kInfiniteLoopHighlightedState animated:NO];
                    
                } else {
                    
                    [stateView changeToState:kInfiniteLoopNormalState animated:NO];
                }
            }
        }
        
    } else {
        
        self.nodeViewsContentView.alpha = 0.f;
    }
}

@end
