//
//  FCInfiniteLoopViewProtocol.h
//  FCAnimations
//
//  Created by fcx on 2017/12/28.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIkit.h>

@protocol FCInfiniteLoopViewProtocol <NSObject>

@required

/**
 *  Get the data object.
 *
 *  @return The data object.
 */
- (id)dataObject;

/**
 *  Get the Image url string.
 *
 *  @return Image url string.
 */
- (NSString *)imageUrlString;

@end
