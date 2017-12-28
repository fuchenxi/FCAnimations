//
//  FCInfiniteLoopViewCell.h
//  FCAnimations
//
//  Created by fcx on 2017/12/28.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCInfiniteLoopViewProtocol.h"

@interface FCInfiniteLoopViewCell : UICollectionViewCell

/**
 *  Data model.
 */
@property (nonatomic, weak) id <FCInfiniteLoopViewProtocol>  dataModel;

/**
 *  Index path.
 */
@property (nonatomic, weak) NSIndexPath *indexPath;

/**
 *  Setup the UICollectionViewCell.
 */
- (void)setupCollectionViewCell;

/**
 *  Build the subView.
 */
- (void)buildSubView;

/**
 *  Load the data.
 */
- (void)loadContent;

/**
 *  Will display.
 */
- (void)willDisplay;

/**
 *  Did end display.
 */
- (void)didEndDisplay;

/**
 The contentOffset, you can use this value to do sth.
 
 @param offset The offset.
 */
- (void)contentOffset:(CGPoint)offset;

@end
