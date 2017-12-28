//
//  FCBaseCustomViewController.h
//  FCAnimations
//
//  Created by fcx on 2017/12/27.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import "FCCustomViewController.h"
#import "FCControllerBaseViewConfig.h"
#import "FCShowLoadingView.h"

@interface FCBaseCustomViewController : FCCustomViewController

extern NSString * const windowAreaViewId;
extern NSString * const loadingAreaViewId;
extern NSString * const titleViewId;
extern NSString * const contentViewId;
extern NSString * const backgroundViewId;

//  level            view            frame
//  ---------------------------------------------------------------
//
//  highest          windowView      0 x  0 x width x height
//
//  higher           loadingView     0 x 64 x width x (height - 64)
//
//  high             titleView       0 x  0 x width x 64
//
//  high             contentView     0 x 64 x width x (height - 64)
//
//  normal           backgroundView  0 x  0 x width x height
//

@property (nonatomic, strong) FCShowLoadingView  *windowAreaView;
@property (nonatomic, strong) FCShowLoadingView  *loadingAreaView;
@property (nonatomic, strong) UIView           *titleView;
@property (nonatomic, strong) UIView           *contentView;
@property (nonatomic, strong) UIView           *backgroundView;

#pragma mark - Overwrite By Subclass.
/**
 *  Overwrite to config subViews.
 *
 *  @param viewsConfig Configs.
 */
- (void)makeViewsConfig:(NSMutableDictionary <NSString *, FCControllerBaseViewConfig *> *)viewsConfig;

/**
 *  Setup data source.
 */
- (void)setupDataSource;

/**
 *  Overwrite to setup titleView, contentView etc.
 */
- (void)setupSubViews;


@end
