//
//  FCInfiniteLoopViewBuilder.h
//  FCAnimations
//
//  Created by fcx on 2017/12/28.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCInfiniteLoopViewProtocol.h"
#import "FCInfiniteLoopCellClassProtocol.h"
#import "FCInfiniteNodeView.h"

@class FCInfiniteLoopViewBuilder, FCInfiniteLoopViewCell;

@protocol FCInfiniteLoopViewBuilderDelegate <NSObject>

@optional

/**
 *  Get the InfiniteLoopViewBuilder's data.
 *
 *  @param infiniteLoopViewBuilder  FCInfiniteLoopViewBuilder's object.
 *  @param data                     data.
 *  @param index                    Current index.
 */
- (void)infiniteLoopViewBuilder:(FCInfiniteLoopViewBuilder *)infiniteLoopViewBuilder
                           data:(id <FCInfiniteLoopViewProtocol>)data
                  selectedIndex:(NSInteger)index
                           cell:(FCInfiniteLoopViewCell *)cell;

/**
 *  Did scroll to get the current page.
 *
 *  @param infiniteLoopViewBuilder FCInfiniteLoopViewBuilder's object.
 *  @param index                   Current index.
 */
- (void)infiniteLoopViewBuilder:(FCInfiniteLoopViewBuilder *)infiniteLoopViewBuilder
           didScrollCurrentPage:(NSInteger)index;

@end


typedef NS_ENUM(NSUInteger, ENodeViewShowPosition) {
    
    kNodeViewTop,
    kNodeViewTopLeft,
    kNodeViewTopRight,
    
    kNodeViewBottom,
    kNodeViewBottomLeft,
    kNodeViewBottomRight,
    
    kNodeViewLeft,
    kNodeViewLeftTop,
    kNodeViewLeftBottom,
    
    kNodeViewRight,
    kNodeViewRightTop,
    kNodeViewRightBottom,
};


@interface FCInfiniteLoopViewBuilder : UIView

/**
 *  InfiniteLoopViewBuilder's delegate.
 */
@property (nonatomic, weak) id <FCInfiniteLoopViewBuilderDelegate> delegate;

/**
 *  The contentView that you can add view to it.
 */
@property (nonatomic, strong, readonly) UIView  *contentView;

/**
 *  FCInfiniteNodeView's template.
 */
@property (nonatomic, strong) FCInfiniteNodeView  *nodeViewTemplate;

@property (nonatomic, assign, getter = isShowNodeView) BOOL showNodeView;

/**
 *  NodeStateViews's edgeInsets.
 */
@property (nonatomic) UIEdgeInsets  edgeInsets;

/**
 *  Image model's array, you must set this value.
 */
@property (nonatomic, strong) NSArray <FCInfiniteLoopViewProtocol, FCInfiniteLoopCellClassProtocol>  *models;

/**
 *  Set the NodeView's size, default is (10, 10).
 */
@property (nonatomic) CGSize  sampleNodeViewSize;

/**
 *  The CustomNodeStateViews show position, default is kNodeViewBottom.
 */
@property (nonatomic) ENodeViewShowPosition  position;

/**
 *  Scroll time interval, default is 4s.
 */
@property (nonatomic) NSTimeInterval  scrollTimeInterval;

/**
 *  Scroll direction, default is horizontal.
 */
@property (nonatomic) UICollectionViewScrollDirection  scrollDirection;

/**
 *  Start the loop.
 *
 *  @param animated Animated or not.
 */
- (void)startLoopAnimated:(BOOL)animated;

/**
 *  Adjust when freeze.
 */
- (void)adjustWhenFreeze;

@end
