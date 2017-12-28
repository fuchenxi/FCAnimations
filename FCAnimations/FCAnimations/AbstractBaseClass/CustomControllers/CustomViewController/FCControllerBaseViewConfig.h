//
//  FCControllerBaseViewConfig.h
//  FCAnimations
//
//  Created by fcx on 2017/12/27.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FCControllerBaseViewConfig : NSObject

@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, assign, getter = isExist) BOOL exist;
@property (nonatomic, assign) CGRect frame;

@end
