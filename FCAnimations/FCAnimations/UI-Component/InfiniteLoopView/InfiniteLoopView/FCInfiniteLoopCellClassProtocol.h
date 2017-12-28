//
//  FCInfiniteLoopCellClassProtocol.h
//  FCAnimations
//
//  Created by fcx on 2017/12/28.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FCInfiniteLoopCellClassProtocol <NSObject>

@required

/**
 *  Cell's reuseIdentifier.
 *
 *  @return Cell's reuseIdentifier.
 */
- (NSString *)cellReuseIdentifier;

/**
 *  CustomInfiniteLoopCell's subClass.
 *
 *  @return CustomInfiniteLoopCell's subClass.
 */
- (Class)cellClass;

@end
