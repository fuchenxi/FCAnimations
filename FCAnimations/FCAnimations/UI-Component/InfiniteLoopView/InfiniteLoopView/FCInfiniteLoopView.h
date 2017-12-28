//
//  FCInfiniteLoopView.h
//  FCAnimations
//
//  Created by fcx on 2017/12/28.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCInfiniteLoopViewProtocol.h"
#import "FCInfiniteLoopCellClassProtocol.h"
#import "FCInfiniteLoopViewCell.h"

@class FCInfiniteLoopView;

@protocol FCInfiniteLoopViewDelegate <NSObject>

@required
/**
 *  Get the InfiniteLoopView's data.
 *
 *  @param infiniteLoopView InfiniteLoopView's object.
 *  @param data             data.
 *  @param index            Current index.
 *  @param cell             CustomInfiniteLoopCell type's cell.
 */
- (void)infiniteLoopView:(FCInfiniteLoopView *)infiniteLoopView
                    data:(id <FCInfiniteLoopViewProtocol>)data
           selectedIndex:(NSInteger)index
                    cell:(FCInfiniteLoopViewCell *)cell;

/**
 *  Did scroll to get the current page.
 *
 *  @param infiniteLoopView InfiniteLoopView's object.
 *  @param index            Current index.
 */
- (void)infiniteLoopView:(FCInfiniteLoopView *)infiniteLoopView didScrollCurrentPage:(NSInteger)index;

@end

@interface FCInfiniteLoopView : UIView

/**
 *  InfiniteLoopView's delegate.
 */
@property (nonatomic, weak) id <FCInfiniteLoopViewDelegate> delegate;

/**
 *  Image model's array, you must set this value.
 */
@property (nonatomic, strong) NSArray <FCInfiniteLoopViewProtocol, FCInfiniteLoopCellClassProtocol> *models;

/**
 *  Scroll time interval, default is 4s.
 */
@property (nonatomic) NSTimeInterval  scrollTimeInterval;

/**
 *  Scroll direction, default is horizontal.
 */
@property (nonatomic) UICollectionViewScrollDirection scrollDirection;

/**
 *  Stop the loop animation and let the image model's array equal nil.
 */
- (void)reset;

/**
 *  Before start the loop animation, you should run this method before.
 */
- (void)prepare;

/**
 *  Start the loop animation.
 */
- (void)startLoopAnimation;

/**
 *  Stop the loop animation.
 */
- (void)stopLoopAnimation;

/**
 *  Current page value.
 */
@property (nonatomic, readonly) NSInteger currentPage;

/**
 *  Adjust when freeze.
 */
- (void)adjustWhenFreeze;

@end
