//
//  FCShowLoadingView.h
//  FCAnimations
//
//  Created by fcx on 2017/12/27.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FCShowLoadingView : UIView

@property (nonatomic, readonly) NSInteger count;

- (void)push;

- (void)pop;

@end
